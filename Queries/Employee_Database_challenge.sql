--Deliverable 1
--Retrieve emp_no, first_name, last_name columns from employees table
--Retrieve title, from_date, to_date columns from titles table
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
--Create new table
--INTO retirement_titles
--Join tables by pk
FROM employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
--Filter birth_date born between 1952-1958
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--Order by emp_no
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
-- Retrieve emp_no, first_name, last_name, title from the retirement_titles table
-- Use distinct on to retrieve first occurence of the emp_no
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

-- Create unique titles table as csv
--INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

--
COUNT(ut.emp_no), ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
e.from_date,
e.to_date,
t.title
--DISTINCT ON(emp_no)
--INTO mentor_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;