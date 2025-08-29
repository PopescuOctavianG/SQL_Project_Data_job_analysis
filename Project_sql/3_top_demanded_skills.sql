select 
    skills,
    count(sj.job_id) as demand_count
from job_postings_fact jf 
inner join skills_job_dim sj
    on jf.job_id = sj.job_id
inner join skills_dim s
    on sj.skill_id = s.skill_id
where job_title_short = 'Data Analyst'
    and job_work_from_home = true
group by skills
order by 2 desc
limit 5