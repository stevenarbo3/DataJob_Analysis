/*
Find the optimal skills for Data Scientist / Analyst
Combine 3rd and 4t queries to get the skill, average salary, and demand
*/

SELECT
    skills AS skill,
    COUNT(skills) AS demand,
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    (job_work_from_home = true OR job_location = 'Boston, MA')
GROUP BY
    skills
ORDER BY
    demand DESC,
    avg_salary DESC
