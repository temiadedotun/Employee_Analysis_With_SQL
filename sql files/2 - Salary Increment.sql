/*
Question: Who are the employees that are due for a salary increase?
- Set the conditions for getting a salary increase
- Why? This encourages employee recognition and embraces employee compensation
*/


SELECT
    employee_id
FROM
    employee_data
WHERE
    employment_type <> 'Contract' AND
    (
        ((EXTRACT (YEAR FROM start_date) = 2018 AND year_of_experience >= 7) OR 
        (EXTRACT (YEAR FROM start_date) BETWEEN 2019 AND 2021 AND year_of_experience >= 10)) 
        AND exit_date IS NULL
    ) AND
    employee_rating = 5 AND
    annual_salary < (SELECT 
                        ROUND (AVG (annual_salary), 0)
                    FROM 
                        employee_data
                    WHERE 
                        employment_type <> 'Contract' AND
                        exit_date IS NULL)