
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
					rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_Date DESC;

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
Group BY ut.title
ORDER BY COUNT(ut.emp_no)DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
					e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					t.title
FROM employees AS e
	INNER JOIN department_employee AS de
		ON(e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON(e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;