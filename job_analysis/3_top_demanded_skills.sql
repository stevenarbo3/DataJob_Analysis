/*
Find the most in demand skills for Data Scientists
Use all job postings and identify the top 5 most valuable skills
May experiment with finding remote and boston locations
*/

SELECT
    skills,
    COUNT(*) AS skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    (job_work_from_home = true OR job_location = 'Boston, MA')
GROUP BY
    skills
ORDER BY
    skill_count DESC
LIMIT 5;