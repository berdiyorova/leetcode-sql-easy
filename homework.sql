--Employee Bonus
SELECT
    e.name,
    b.bonus
FROM
    Employee e
LEFT JOIN
    Bonus b
ON
    e.empId = b.empId
WHERE
    b.bonus < 1000 OR b.bonus IS NULL;


--Students and Examinations
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    Students s
CROSS JOIN
    Subjects sub
LEFT JOIN
    Examinations e
ON
    s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id;


--Not Boring Movies
SELECT * FROM Cinema
WHERE
    id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;


--Average Selling Price
SELECT
    p.product_id,
    COALESCE(ROUND(SUM(u.units * p.price)::numeric / SUM(u.units), 2), 0) AS average_price
FROM
    UnitsSold u
RIGHT JOIN
    Prices p
ON
    u.product_id = p.product_id
    AND u.purchase_date BETWEEN p.start_date
    AND p.end_date
GROUP BY
    p.product_id;


--Project Employees I
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years)::numeric, 2) AS average_years
FROM
    Project p
JOIN
    Employee e
ON
    p.employee_id = e.employee_id
GROUP BY
    p.project_id
ORDER BY
    p.project_id