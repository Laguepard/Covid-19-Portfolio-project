COVID-19 Global Exploratory Analysis
A data-driven exploration of infections, mortality, and vaccination progress across countries.
Overview
This project analyzes global COVID-19 data to understand how the pandemic unfolded across different countries and regions. The analysis focuses on reported infections, deaths, and vaccination progress while highlighting population-level impacts and temporal trends.
The dataset includes daily observations for most countries and is sourced from publicly available global COVID-19 reporting systems. The objective is to uncover meaningful patterns and compare how countries and continents differ in their pandemic trajectories.
________________________________________
Key Analytical Questions
The project investigates several central epidemiological themes:
1. Infection Trends
•	How did reported COVID-19 cases evolve over time across countries?
•	What proportion of each country's population was ever infected?
•	Which countries experienced the highest levels of infection penetration?
2. Mortality Impact
•	What were the mortality rates among confirmed cases (Case Fatality Rate)?
•	How do reported death counts differ across countries and continents?
•	Which regions bore the greatest mortality burden?
3. Vaccination Progress
•	How quickly did countries roll out vaccinations?
•	How does cumulative vaccination progress compare to national populations?
•	What percentage of people received at least one reported vaccination dose?
________________________________________
Methods and Approach
The analysis relies on standard data-exploration techniques, including:
Filtering and Cleaning
•	Country-level records are isolated by removing aggregate continent-level entries.
•	Null values in vaccination data are handled to ensure accurate cumulative calculations.
Aggregation and Ranking
•	Highest reported infection counts and death totals are tracked per country.
•	Countries are compared using per-capita measures such as percentage of population infected.
Population-Adjusted Metrics
To enable fair comparison across countries of different sizes:
•	Infection prevalence is expressed as a percentage of population.
•	Vaccination progress is assessed relative to national population size.
•	Mortality rates are calculated as proportions of confirmed cases.
Cumulative Trends
Rolling cumulative vaccination counts are computed to measure progress over time.
This enables examination of:
•	Acceleration or slowdown in vaccination rollout
•	Long-term coverage compared to population size
________________________________________
Epidemiological Considerations
To ensure responsible interpretation, the analysis acknowledges key limitations inherent in COVID-19 reporting:
1. Reported Cases Are Not True Infections
Testing availability, testing policy, and case-definition changes vary across countries.
Reported totals generally underestimate the true number of infections.
2. Mortality Data May Be Incomplete
Many countries experienced:
•	Limited death certification capacity
•	Delays in recording
•	Reclassification of deaths
This affects cumulative death counts and mortality comparisons.
3. Vaccination Data Often Contains Gaps
Daily vaccination updates may be:
•	Missing
•	Partially reported
•	Retroactively corrected
Cumulative vaccination curves must therefore be interpreted cautiously.
4. CFR Has a Time-Lag Issue
Deaths occur weeks after infection, while confirmed cases are reported immediately.
Therefore, the Case Fatality Rate does not fully capture infection-fatality risk.
________________________________________
Outputs
The analysis produces several key outputs:
•	Ranked lists of countries by infection prevalence and total deaths
•	Continent-level summaries of mortality burden
•	Time-series views of cumulative vaccination progress
•	Population-adjusted metrics for fair comparison across countries
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
•	Data analysts and researchers
•	Students learning SQL for epidemiological analysis
•	Public health practitioners
•	Anyone exploring cross-country pandemic data
________________________________________
How to Use
1.	Load the data into your preferred SQL environment.
2.	Run the analysis script provided in the repository.
3.	Explore the outputs to answer specific epidemiological or analytical questions.
________________________________________
Acknowledgement of Data Limitations
All results reflect reported numbers, not actual pandemic burden.
Differences in testing, reporting quality, and healthcare capacity directly influence the values seen in this analysis. Interpret all findings within this context.

