# Introduction
This project was designed to analyze the employee data of an organization over time. It focuses on three Human Resource insights🔍: Movement patterns🔄, Compensation review💰, and Performance assessment🙍. 

🔍 You can check out the SQL queries here: [sql files folder](/sql%20files/)
# Background
Human Resource teams rely heavily on accurate and timely employee data to make informed decisions around workforce planning, compensation, and retention. The project focuses on answering practical business questions that HR and management teams frequently encounter, especially at the end of a calender year.

Data is from [Kaggle](https://www.kaggle.com/datasets/ravindrasinghrana/employeedataset?resource=download)

### Project Objectives
This project answers the following questions:
1. What is the employee turnover rate over the years?
2. Who are the employees that are eligible for a salary increment?
3. Who are the employees that are on probation?

# Tools I Used
I utilzed several key tools in my analysis:
- **SQL:** The heart of the analysis. It allowed me to query the database to uncover insights.
- **PostgreSQL:** This served as my choice of a database management system.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & Github:** Git was essential for version control and project tracking. Github is responsible for sharing my SQL scripts and analysis.

# The Analysis
Each query in this project was designed to examine a distinct component of an organization’s human resource operations. Here's how I approached each question:
### 1. Employee Turnover Rate
To obtain the turnover rate, I divided the number of employees that left in that year by the average number of employees ([number of employees at the start of the year + number of employees at the end of the year]/2), and multiplied it by 100. 

### 2. Employee Salary Increment Eligibility
To uncover the employees that are eligible for a salary increment, I **focused** the filtering of the employee id by start date and year of experience. This query highlights employees who have spent a certain duration in the organization. 

### 3. Employee Probation Status
To uncover the employees that are on probation, and to determine for how long, I filtered employee id by employee rating, and set two conditions.
``` sql
SELECT
   employee_id,
    CASE
        WHEN employee_rating = 1 THEN 'Six Months'
        WHEN employee_rating = 2 THEN 'Three Months'
        END AS probation_period
FROM
    employee_data
WHERE
    exit_date IS NULL AND
    employee_rating < (SELECT
                           ROUND (AVG (employee_rating), 0)
                        FROM
                            employee_data
                        WHERE
                            exit_date IS NULL)
```

# What I learned
Working on this project, I got to really improve my SQL reasoning and skills. I learned about casting data types and joining tables by listing them in FROM. Also, using CTEs and Subqueries made it possible for me to really dig deeper into insights. I also got to level up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
# Conclusions
### Insights
From the analysis, these were the insights:

1. The employee turnover rate increased 📈 every year from 2019, starting from a **12.52%** all the way to **37.23%**, with the most dramatic deterioration happening between 2021 & 2022. Early years show moderate increases, while later years show sharp spikes. This suggests growing retention challenges.

![Turnover Rate](/assets/Turnover%20Rate%20&%20Year%20Over%20Year.png)
*Line chart visualizing the employee turnover rate and year-over-year change between 2019 & 2023. Excel was used to create this chart.*

2. Out of 973 employees assessed, only 20 (approximately 2.1% of the workforce) met all eligibility criteria for a salary increment ✅. This indicates that a very large percent of the workforce have either not spent long at the organization, or are more in entry or mid-level positions.

3. Three hundred and eighty-three employees  (approximately 39.4% of the workforce) failed ❌ to meet the requirement for exceeding a probation. Two hundred and forty-four are on a three-month probation period, while one hundred and thirty-nine are on a six-month probation period.

### Closing Thoughts
A substantial proportion of the workforce remains within the probationary stage after the assessment period. This workforce composition set a constraint for the eligibility for salary increments, as observed from the low proportion of employees who qualify for compensation adjustment. When viewed alongside the consistently rising turnover trend, particularly the sharp year-over-year increase observed in 2022, these findings suggest a potential retention challenge associated with limited progression and reward opportunities for a largely early-tenure employee population.
