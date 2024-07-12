/*
Find the top paying skills
Specifically find the average salary for each skill
Can focus location, role, and identify top skills as well
Remove nulls
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    (job_location = 'Boston, MA' OR job_work_from_home = true)
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 30


