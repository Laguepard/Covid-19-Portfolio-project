/****************************************************************************************
PortfolioProject: Exploratory Analysis of Global COVID-19 Data
Author: Léon Habineza
Purpose: 
    This script analyzes COVID-19 reported cases, deaths, and vaccination data. 
    The goal is to explore mortality rates, infection prevalence, population-level impacts, 
    and vaccination progress using cumulative counts, per-capita rates, and window functions.
Note:
    All results are based on reported data; actual infections and deaths may differ due to
    underreporting, testing differences, and reporting lags.
****************************************************************************************/

USE PortfolioProject;

------------------------------------------------------------
-- 1. Initial Exploration of Dataset
-- Filter out continent-level aggregates to keep only country-level observations
------------------------------------------------------------
SELECT *
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;

------------------------------------------------------------
-- 2. Core Epidemiological Fields
-- Examining key variables for infection and mortality trends
------------------------------------------------------------
SELECT
    date,
    location,
    population,
    total_cases,
    new_cases,
    total_deaths
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;

------------------------------------------------------------
-- 3. Mortality Rate (Case Fatality Rate)
-- CFR = proportion of confirmed cases resulting in death
-- Note: CFR is based on reported cases and deaths, does not account for reporting lag
------------------------------------------------------------
SELECT 
    location,
    date,
    total_cases,
    total_deaths,
    ROUND((total_deaths * 100.0) / NULLIF(total_cases,0), 2) AS DeathsPercentage
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
  AND location LIKE '%Rwanda%'
ORDER BY location, date;

------------------------------------------------------------
-- 4. Infection Prevalence (Incidence Proportion)
-- Measures maximum proportion of population ever infected per country
------------------------------------------------------------
SELECT
    location,
    population,
    MAX(total_cases) AS highest_infection_count,
    ROUND(MAX(CAST(total_cases AS FLOAT)) / population * 100, 2) AS percent_population_infected
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percent_population_infected DESC;

------------------------------------------------------------
-- 5. Countries with Highest Total Deaths
-- Identifies countries with greatest mortality burden
------------------------------------------------------------
CREATE OR ALTER VIEW dbo.deaths_per_country AS
SELECT
    location,
    MAX(total_deaths) AS total_deaths
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location;

-- Example query to inspect
SELECT *
FROM dbo.deaths_per_country
ORDER BY total_deaths DESC;

------------------------------------------------------------
-- 6. Continents with Highest Mortality Burden
-- Aggregates maximum reported deaths per continent
------------------------------------------------------------
CREATE OR ALTER VIEW dbo.deaths_per_continent AS
SELECT
    continent,
    SUM(MAX(total_deaths)) OVER(PARTITION BY continent) AS total_deaths
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent;

-- Example query to inspect
SELECT *
FROM dbo.deaths_per_continent
ORDER BY total_deaths DESC;

------------------------------------------------------------
-- 7. Vaccination Progress Using a CTE
-- Calculates cumulative vaccinations per country
-- Handles null values and computes % of population vaccinated
------------------------------------------------------------
WITH Pop_vs_Vacc AS (
    SELECT 
        cd.continent, 
        cd.location, 
        cd.date, 
        cd.population, 
        COALESCE(cv.new_vaccinations, 0) AS new_vaccinations,
        SUM(COALESCE(cv.new_vaccinations,0)) 
            OVER(PARTITION BY cd.location ORDER BY cd.date) AS rolling_people_vaccinated
    FROM dbo.CovidDeaths cd
    JOIN dbo.CovidVaccinations cv
        ON cd.location = cv.location
       AND cd.date = cv.date
    WHERE cd.continent IS NOT NULL
)
SELECT *,
       ROUND(rolling_people_vaccinated * 100.0 / NULLIF(population,0),2) AS percent_population_vaccinated
FROM Pop_vs_Vacc
ORDER BY location, date DESC;

------------------------------------------------------------
-- 8. Temporary Table Version for Vaccination Progress
-- Useful for repeated queries, joins, or staged analysis
------------------------------------------------------------
DROP TABLE IF EXISTS #percent_population_vaccinated;

CREATE TABLE #percent_population_vaccinated (
    continent NVARCHAR(255),
    location NVARCHAR(255),
    date DATETIME,
    population NUMERIC,
    new_vaccinations NUMERIC,
    rolling_people_vaccinated NUMERIC
);

INSERT INTO #percent_population_vaccinated
SELECT 
    cd.continent,
    cd.location,
    cd.date,
    cd.population,
    COALESCE(cv.new_vaccinations,0) AS new_vaccinations,
    SUM(COALESCE(cv.new_vaccinations,0))
        OVER(PARTITION BY cd.location ORDER BY cd.date) AS rolling_people_vaccinated
FROM dbo.CovidDeaths cd
JOIN dbo.CovidVaccinations cv
    ON cd.location = cv.location
   AND cd.date = cv.date
WHERE cd.continent IS NOT NULL;

-- Inspect cumulative vaccination progress
SELECT *,
       ROUND(rolling_people_vaccinated * 100.0 / NULLIF(population,0),2) AS percent_population_vaccinated
FROM #percent_population_vaccinated
ORDER BY location, date DESC;
