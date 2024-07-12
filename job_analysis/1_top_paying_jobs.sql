/*
Find the top paying Data Scientist jobs that are available remotely or in my area of Boston, MA
Specifically, lets identify the top 10 highest paying jobs in this category
*/

SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    (job_work_from_home = true OR job_location = 'Boston, MA') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

