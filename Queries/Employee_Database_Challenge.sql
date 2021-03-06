--getting all employees around retirement age
SELECT e.emp_no, e.first_name, e.last_name, 
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--most recent job title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY Count desc;

--Deliverable 2
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01' AND
e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no ASC;

--Extra Tables
--Mentorship Titles
SELECT title, COUNT(emp_no)
INTO mentorship_titles
FROM mentorship_eligibilty
Group BY title
Order BY Count(emp_no) DESC;