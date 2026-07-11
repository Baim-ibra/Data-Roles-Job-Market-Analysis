--  Step 1 Create Table company_dim with primary key

CREATE TABLE company_dim (
company_id INT PRIMARY KEY NOT NULL,
name VARCHAR(255) NOT NULL,
link VARCHAR (MAX),
link_google VARCHAR (MAX),
thumbnail VARCHAR (MAX)
);
SELECT* FROM  company_dim

--  Step 2 Create Table skills_dim with primary key
CREATE TABLE skills_dim (
skill_id INT PRIMARY KEY NOT NULL,
skills VARCHAR(100) NOT NULL,
type varchar (100)
);

--  Step 3 Create Table job_posting_fact with primary key and foreign key

CREATE TABLE job_posting_fact (
job_id INT PRIMARY KEY NOT NULL,
company_id INT,
job_title_short VARCHAR (50),
job_title VARCHAR (255) NOT NULL,
job_location VARCHAR (100),
job_via VARCHAR (50),
job_schedule_type VARCHAR (50) NOT NULL,
job_work_from_home BIT,
search_location VARCHAR (50),
job_posted_date DATETIME,
job_no_degree_mention BIT,
job_health_insurance BIT,
job_country VARCHAR(25),
salary_rate VARCHAR (50),
salary_year_avg DECIMAL (10,2),
salary_hour_avg DECIMAL (10,2),

CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES company_dim(company_id)
);

--CREATE junction Table called skills_job_dim--

CREATE TABLE skills_job_dim (
    job_id INT,
    skill_id INT,
    
    CONSTRAINT pk_skills_job PRIMARY KEY (job_id, skill_id),
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES dbo.job_postings_fact (job_id),
    CONSTRAINT fk_skill FOREIGN KEY (skill_id) REFERENCES dbo.skills_dim (skill_id)
);
    






