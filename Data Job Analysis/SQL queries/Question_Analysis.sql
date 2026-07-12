/*--Most In-Demand Skills: 
--What is the most demand skills that company looking for?
*/
WITH skills_count AS (
SELECT
COUNT (j.job_id) AS job_count,
sj.skill_id
 FROM job_postings_fact j
 JOIN skills_job_dim sj On sj.job_id =j.job_id
 GROUP BY skill_id)
 
 SELECT TOP 10
 skills,
 type,
sc.job_count
 FROM skills_dim
 JOIN skills_count sc ON sc.skill_id = skills_dim.skill_id
 ORDER BY sc.job_count DESC;
 GO
 
/* Question : What is the sweet spot between most demand skills and a highpay skills in the market */
WITH optimal_skills AS (
    SELECT 
        sd.skill_id,
        sd.skills,
        COUNT(j.job_id) AS job_count,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM dbo.job_postings_fact j
    INNER JOIN dbo.skills_job_dim sj ON j.job_id = sj.job_id
    INNER JOIN dbo.skills_dim sd ON sj.skill_id = sd.skill_id
    WHERE j.salary_year_avg IS NOT NULL
    GROUP BY sd.skill_id,skills
)
SELECT TOP 25
    os.skills,
    job_count,
    avg_salary
FROM optimal_skills os
WHERE job_count > 10 
ORDER BY 
    avg_salary DESC,
    job_count DESC; 
/* Question : What company that paying a high salary for a data analyst role
*/

WITH job_data AS (
SELECT
j.job_id,
j.job_title_short,
j.company_id,
j.salary_year_avg
FROM job_postings_fact j
WHERE job_title_short = 'Data Analyst'
AND j.salary_year_avg IS NOT NULL
)

SELECT TOP 10
jd.*,
sd.skills,
cd.name
FROM job_data jd
LEFT JOIN company_dim cd ON cd.company_id = jd.company_id
LEFT JOIN skills_job_dim sj ON sj.job_id = jd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sj.skill_id
ORDER BY jd.salary_year_avg DESC

