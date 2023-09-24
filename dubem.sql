use Amazon_employess;
-- HOW MANY EMPLOYEES ARE THERE IN THE COMPANY
SELECT Count(*) as Number_Of_Employees FROM employees;

--DISTRIBUTION OF PERFORMANCE RATING ACROSS ALL THE EMPLOYEES
SELECT performance_rating, COUNT(*) as rating_count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM per_reviews), 2) AS percentage
FROM per_reviews
GROUP BY performance_rating
ORDER BY performance_rating

-- WHAT IS THE OVERALL AVERAGE PERFORMANCE RATING FOR THE COMPANY
SELECT AVG(performance_rating) as Overall_Performance FROM per_reviews


-- MOST RECENT PERFORMANCE REVIEW FOR EACH EMPLOYEE
SELECT employee_id, MAX(review_date) AS most_recent_review
FROM per_reviews
GROUP BY employee_id
ORDER BY most_recent_review DESC

-- EMPLOYEES WHO HAVE NOT RECEIVED PERFORMANCE REVIEW
SELECT e.employee_id,e.first_name,e.last_name
FROM employees as e 
LEFT JOIN per_reviews as p 
on e.employee_id = p.employee_id
WHERE p.employee_id IS NULL


-- TOP PERFORMING EMPLOYEES IN EACH DEPARTMENT
SELECT e.employee_id,e.first_name,e.last_name
FROM employees as e 
LEFT JOIN per_reviews as p 
on e.employee_id = p.employee_id
WHERE p.performance_rating > 4

-- DEPARTMENT WITH THE HIGHEST AVERAGE PERFORMANCE RATING

SELECT COUNT(e.employee_id) Number_Of_Employees,e.department,ROUND(AVG(p.performance_rating), 2) avg_per_rating
FROM employees as e 
LEFT JOIN per_reviews as p 
on e.employee_id = p.employee_id
WHERE p.performance_rating > 4
GROUP BY e.department
ORDER BY avg_per_rating DESC



-- POPULAR TRAINING TOPIC
SELECT training_topic, COUNT(*) as popularty
from training
GROUP BY training_topic
ORDER BY popularty DESC


-- AVERAGE PERFORMANCE RATING FOR EACH DEPARTMENT

SELECT e.department,AVG(p.performance_rating) as avg_performance_rating
FROM employees as e 
INNER JOIN per_reviews as p 
on e.employee_id = p.employee_id
GROUP by e.department
ORDER by e.department

-- DEPARTMENT WITH THE HIGHEST AVERAGE PERFORMANCE RATINGS

SELECT TOP 1 e.department, AVG(p.performance_rating) as avg_performance_rating
FROM employees as e 
INNER JOIN per_reviews as p 
ON e.employee_id = p.employee_id
GROUP BY e.department
ORDER BY avg_performance_rating DESC

-- DEPARTMENT WITH THE LOWEST AVERAGE RATING

SELECT TOP 1 e.department, AVG(p.performance_rating) as avg_performance_rating
FROM employees as e 
INNER JOIN per_reviews as p 
ON e.employee_id = p.employee_id
GROUP BY e.department
ORDER BY avg_performance_rating ASC

-- DEPARTMENT AND THEIR RESPECTIVE HEADOUT
SELECT COUNT(employee_id) total_number, department from employees
group BY department
ORDER BY total_number DESC

-- top performing employees

SELECT top 10  e.first_name,e.last_name,e.age,p.performance_rating
from employees as e 
INNER JOIN per_reviews as p 
on e.employee_id = p.employee_id
WHERE p.performance_rating > 4






SELECT * From per_reviews








