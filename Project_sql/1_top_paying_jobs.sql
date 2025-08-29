SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name as company_name,
    job_posted_date
from job_postings_fact j
left join company_dim c
    on j.company_id = c.company_id
where job_title_short ='Data Analyst'
    and job_location = 'Anywhere'
    and salary_year_avg is not null
order by salary_year_avg desc
limit 10;