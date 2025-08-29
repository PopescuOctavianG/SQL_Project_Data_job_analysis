select 
    s.skill_id,
    s.skills,
    count(sd.job_id) as demand_count,
    round(avg(salary_year_avg),2) as avg_salary
from job_postings_fact jf 
inner join skills_job_dim sd
    on jf.job_id = sd.job_id
inner join skills_dim s
    on sd.skill_id = s.skill_id
where job_title_short = 'Data Analyst'
    and salary_year_avg is not null
    and job_work_from_home = true
group by s.skill_id
    having count(sd.job_id) >10 
order by 3 desc, 4 desc
limit 25;

