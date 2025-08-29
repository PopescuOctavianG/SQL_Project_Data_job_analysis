select 
    skills,
    round(avg(salary_year_avg),2) as avg_salary
from job_postings_fact jf 
inner join skills_job_dim sj
    on jf.job_id = sj.job_id
inner join skills_dim s
    on sj.skill_id = s.skill_id
where job_title_short = 'Data Analyst'
    and salary_year_avg is not null
group by skills
order by 2 desc
limit 25