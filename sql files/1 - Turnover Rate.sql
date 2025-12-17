/*
Question: What is the annual turnover rate over the years?
- Get number of employees that left in that year
- Get the average number of employees
    - This can be found by adding the number of employees at
        the start and end of the year, and dividing by 2
- Why? This helps to know how effectively a company retains its employees

- Calculating the turnover rate starts from the year 2019, because it is the first
year that has a count for the employees at the start of the year. Even though 2018
is the oldest year in the start and exit date columns, there were no employees until
Q3, which, if the turnover rate were decided to be calculated, would give an incorrect
figure. Therefore, we can consider 2018 the establishment year.
*/


-- Turnover Rate for 2019 --

WITH starters_count AS (
SELECT
    COUNT (employee_id) AS start_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2019-01-01' AND
    (exit_date IS NULL OR exit_date > '2019-01-01')
),

leavers_count AS (
SELECT
    COUNT (employee_id) AS leave_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (exit_date BETWEEN '2018-01-01' AND '2019-12-31')
),

end_of_year_count AS (
SELECT
    COUNT (employee_id) AS end_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2019-12-31' AND
    (exit_date IS NULL OR exit_date > '2019-12-31')
)

SELECT
    ROUND (CAST (leavers_count.leave_count AS NUMERIC (5,2)) * 100 / 
    (CAST (starters_count.start_count + end_of_year_count.end_count AS NUMERIC (5,2)) / 2), 2) AS turnover_rate
FROM
    starters_count, 
    end_of_year_count, 
    leavers_count


-- Turnover Rate for 2020 --

WITH starters_count AS (
SELECT
    COUNT (employee_id) AS start_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2020-01-01' AND
    (exit_date IS NULL OR exit_date > '2020-01-01')
),

leavers_count AS (
SELECT
    COUNT (employee_id) AS leave_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (exit_date BETWEEN '2020-01-01' AND '2020-12-31')
),

end_of_year_count AS (
SELECT
    COUNT (employee_id) AS end_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2020-12-31' AND
    (exit_date IS NULL OR exit_date > '2020-12-31')
)

SELECT
    ROUND (CAST (leavers_count.leave_count AS NUMERIC (5,2)) * 100 / 
    (CAST (starters_count.start_count + end_of_year_count.end_count AS NUMERIC (6,2)) / 2), 2) AS turnover_rate
FROM
    starters_count, 
    end_of_year_count, 
    leavers_count


-- Turnover Rate for 2021 --

WITH starters_count AS (
SELECT
    COUNT (employee_id) AS start_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2021-01-01' AND
    (exit_date IS NULL OR exit_date > '2021-01-01')
),

leavers_count AS (
SELECT
    COUNT (employee_id) AS leave_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (exit_date BETWEEN '2021-01-01' AND '2021-12-31')
),

end_of_year_count AS (
SELECT
    COUNT (employee_id) AS end_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2021-12-31' AND
    (exit_date IS NULL OR exit_date > '2021-12-31')
)

SELECT
    ROUND (CAST (leavers_count.leave_count AS NUMERIC (5,2)) * 100 / 
    (CAST (starters_count.start_count + end_of_year_count.end_count AS NUMERIC (6,2)) / 2), 2) AS turnover_rate
FROM
    starters_count, 
    end_of_year_count, 
    leavers_count


-- Turnover Rate for 2022 --

WITH starters_count AS (
SELECT
    COUNT (employee_id) AS start_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2022-01-01' AND
    (exit_date IS NULL OR exit_date > '2022-01-01')
),

leavers_count AS (
SELECT
    COUNT (employee_id) AS leave_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (exit_date BETWEEN '2022-01-01' AND '2022-12-31')
),

end_of_year_count AS (
SELECT
    COUNT (employee_id) AS end_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2022-12-31' AND
    (exit_date IS NULL OR exit_date > '2022-12-31')
)

SELECT
    ROUND (CAST (leavers_count.leave_count AS NUMERIC (5,2)) * 100 / 
    (CAST (starters_count.start_count + end_of_year_count.end_count AS NUMERIC (6,2)) / 2), 2) AS turnover_rate
FROM
    starters_count, 
    end_of_year_count, 
    leavers_count


-- Turnover rate for 2023 --

WITH starters_count AS (
SELECT
    COUNT (employee_id) AS start_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2023-01-01' AND
    (exit_date IS NULL OR exit_date > '2023-01-01')
),

leavers_count AS (
SELECT
    COUNT (employee_id) AS leave_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (exit_date BETWEEN '2023-01-01' AND '2023-12-31')
),

end_of_year_count AS (
SELECT
    COUNT (employee_id) AS end_count
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    start_date <= '2023-12-31' AND
    exit_date IS NULL
)

SELECT
    ROUND (CAST (leavers_count.leave_count AS NUMERIC (5,2)) * 100 / 
    (CAST (starters_count.start_count + end_of_year_count.end_count AS NUMERIC (6,2)) / 2), 2) AS turnover_rate
FROM
    starters_count, 
    end_of_year_count, 
    leavers_count