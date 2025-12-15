/*
Question: Who are the employees on probation?
- Set the condition for being on probation
- Set the probabtion period for each employee on probation
- Why? This ensures a work environment doesn't foster mediocrity
*/


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