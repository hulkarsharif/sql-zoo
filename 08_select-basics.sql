-- 1.
-- List the teachers who have NULL for their department.

-- Why we cannot use =

SELECT name
FROM teacher
WHERE dept IS NULL;
