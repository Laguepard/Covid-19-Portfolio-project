COVID-19 Global Exploratory Analysis
________________________________________
A data-driven exploration of infections, mortality, and vaccination progress across countries.
________________________________________
Overview
________________________________________
This project analyzes global COVID-19 data to understand how the pandemic unfolded across different countries and regions. The analysis focuses on reported infections, deaths, and vaccination progress while highlighting population-level impacts and temporal trends.
The dataset includes daily observations for most countries and is sourced from publicly available global COVID-19 reporting systems. The objective is to uncover meaningful patterns and compare how countries and continents differ in their pandemic trajectories.
________________________________________
Key Analytical Questions
The project investigates several central epidemiological themes:
________________________________________
Infection Trends
________________________________________
1.	How did reported COVID-19 cases evolve over time across countries?
2.	What proportion of each country's population was ever infected?
3.	Which countries experienced the highest levels of infection penetration?
________________________________________
Mortality Impact
________________________________________
4.	What were the mortality rates among confirmed cases (Case Fatality Rate)?
5.	How do reported death counts differ across countries and continents?
6.	Which regions bore the greatest mortality burden?
________________________________________
Vaccination Progress
________________________________________
7.	How quickly did countries roll out vaccinations?
8.	How does cumulative vaccination progress compare to national populations?
9.	What percentage of people received at least one reported vaccination dose?
________________________________________
Methods and Approach
The analysis relies on standard data-exploration techniques, including:
________________________________________
Filtering and Cleaning
________________________________________
1.	Country-level records are isolated by removing aggregate continent-level entries.
2.	Null values in vaccination data are handled to ensure accurate cumulative calculations.
________________________________________
Aggregation and Ranking
________________________________________
1.	Highest reported infection counts and death totals are tracked per country.
2.	Countries are compared using per-capita measures such as percentage of population infected.
________________________________________
Population-Adjusted Metrics
________________________________________
1.	To enable fair comparison across countries of different sizes:
2.	Infection prevalence is expressed as a percentage of population.
3.	Vaccination progress is assessed relative to national population size.
4.	Mortality rates are calculated as proportions of confirmed cases.
________________________________________
Cumulative Trends
________________________________________
Rolling cumulative vaccination counts are computed to measure progress over time. This enables examination of:
1.	Acceleration or slowdown in vaccination rollout
2.	Long-term coverage compared to population size
________________________________________
Epidemiological Considerations
________________________________________
To ensure responsible interpretation, the analysis acknowledges key limitations inherent in COVID-19 reporting:
________________________________________
1.	Reported Cases Are Not True Infections
2.	Testing availability, testing policy, and case-definition changes vary across countries.
3.	Reported totals generally underestimate the true number of infections.
4.	Mortality Data May Be Incomplete
________________________________________
Many countries experienced:
________________________________________
1.	Limited death certification capacity
2.	Delays in recording
3.	Reclassification of deaths
This affects cumulative death counts and mortality comparisons.
________________________________________
Vaccination Data Often Contains Gaps
________________________________________
Daily vaccination updates may be:
1.	Missing
2.	Partially reported
3.	Retroactively corrected
4.	Cumulative vaccination curves must therefore be interpreted cautiously.
________________________________________
CFR Has a Time-Lag Issue
________________________________________
Deaths occur weeks after infection, while confirmed cases are reported immediately. Therefore, the Case Fatality Rate does not fully capture infection-fatality risk.
________________________________________
Outputs
The analysis produces several key outputs:
1.	Ranked lists of countries by infection prevalence and total deaths
2.	Continent-level summaries of mortality burden
3.	Time-series views of cumulative vaccination progress
4.	Population-adjusted metrics for fair comparison across countries
These results allow for both high-level regional assessments and country-specific insights.
________________________________________
Project Structure
/data                → Raw COVID-19 data (not included in repo)
/sql                 → SQL scripts for analysis
/outputs             → Optional visualizations or exported tables
README.md            → Project overview and documentation
________________________________________
Intended Audience
This project is designed for:
1.	Data analysts and researchers
2.	Students learning SQL for epidemiological analysis
3.	Public health practitioners
4.	Anyone exploring cross-country pandemic data
________________________________________
How to Use
Load the data into your preferred SQL environment.
Run the analysis script provided in the repository.
Explore the outputs to answer specific epidemiological or analytical questions.
________________________________________
Acknowledgement of Data Limitations
All results reflect reported numbers, not actual pandemic burden.
Differences in testing, reporting quality, and healthcare capacity directly influence the values seen in this analysis. Interpret all findings within this context.
________________________________________
References
________________________________________
The analysis relies on publicly accessible datasets and documentation, including:
1.	Our World in Data (OWID) COVID-19 Dataset
Max Roser, Hannah Ritchie, Esteban Ortiz-Ospina, and Joe Hasell.
Our World in Data. “Coronavirus Pandemic (COVID-19).”
https://ourworldindata.org/coronavirus
2.	OWID COVID-19 Data Documentation
Data structure, variables, and processing notes.
https://github.com/owid/covid-19-data/tree/master/public/data
3.	Population Estimates (included within OWID dataset)
Sourced from international statistical agencies such as the UN, World Bank, and government census offices.
________________________________________
No proprietary or restricted data sources are used in this project.
________________________________________
Author: Léon Habineza, MBA
________________________________________
Researcher | Data Analysis | Project Management


