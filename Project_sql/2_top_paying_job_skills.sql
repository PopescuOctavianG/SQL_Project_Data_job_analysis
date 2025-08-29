with top_paying_jobs as(
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
from job_postings_fact j
left join company_dim c
    on j.company_id = c.company_id
where job_title_short ='Data Analyst'
    and job_location = 'Anywhere'
    and salary_year_avg is not null
order by salary_year_avg desc
limit 10
) 

select 
    tp.*,
    skills
from top_paying_jobs tp
inner join skills_job_dim sj 
    on tp.job_id = sj.job_id
inner join skills_dim s
    on sj.skill_id = s.skill_id
order by salary_year_avg desc