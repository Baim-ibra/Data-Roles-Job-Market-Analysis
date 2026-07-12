

-- Inserting Data from Csv file company_dim into the database
BULK INSERT dbo.company_dim
FROM 'C:\Users\CICI SRIMELATI\Documents\LB\SQL Learning\csv_files\company_dim.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001' 
);
GO
-- - Inserting Data from Csv file skills_dim into the database
BULK INSERT dbo.skills_dim
FROM 'C:\Users\CICI SRIMELATI\Documents\LB\SQL Learning\csv_files\skills_dim.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO

-- - Inserting Data from Csv file job_postings_fact into the database
BULK INSERT dbo.job_postings_fact
FROM 'C:\Users\CICI SRIMELATI\Documents\LB\SQL Learning\csv_files\job_postings_fact.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO

-- - Inserting Data from Csv file job_postings_fact into the database

BULK INSERT dbo.job_postings_fact
FROM 'C:\Users\CICI SRIMELATI\Documents\LB\SQL Learning\csv_files\job_postings_fact.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FORMAT = 'CSV',       
    FIELDQUOTE = '"',     
    MAXERRORS = 5000      -- Mengabaikan baris yang kutipannya cacat
);
GO

-- - Inserting Data from Csv file job_postings_fact into the database
BULK INSERT dbo.skills_job_dim
FROM 'C:\Users\CICI SRIMELATI\Documents\LB\SQL Learning\csv_files\skills_job_dim.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FORMAT = 'CSV'
);
GO
