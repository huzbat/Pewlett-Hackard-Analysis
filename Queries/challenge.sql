
-- Deliverable 1
Select  e.emp_no, 
e.first_name, 
e.last_name,
ti.title, 
ti.from_date,
ti.to_date
into retirement_titles
FROM employees as e
	inner join titles as ti
	on (e.emp_no = ti.emp_no)
where birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no;

-- Remove duplicate rows to find Unique Titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Retrieve retiring titles
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;


--  Deliverable 2 The Employees Eligible for the Mentorship Program
DROP Table mentorship_eligibilty;
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
INTO mentorship_eligibilty
FROM employees as e
Inner Join dept_emp as de
ON (e.emp_no = de.emp_no::integer);
Inner Join titles as t
ON (e.emp_no = t.emp_no);


--  Deliverable 2 The Employees Eligible for the Mentorship Program
DROP Table mentorship_eligibilty;
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
INTO mentorship_eligibilty
FROM employees as e, dept_emp as de,titles as ti
-- Inner Join dept_emp as de
WHERE (e.emp_no = de.emp_no::integer AND e.emp_no = ti.emp_no);
-- Inner Join titles as ti
-- ON (




SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
Inner Join dept_emp as de
ON (e.emp_no = de.emp_no::integer)
Inner Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
