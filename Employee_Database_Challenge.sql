-- Find retiring employees by title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name, 
r.last_name, 
r.title
INTO distinct_retirement_titles
FROM retirement_titles as r
ORDER BY r.emp_no, to_date DESC;

-- Employee count by most recent job title
SELECT COUNT(dr.title), dr.title
INTO retiring_titles
FROM distinct_retirement_titles as dr
GROUP BY dr.title
ORDER BY COUNT(dr.title) DESC;