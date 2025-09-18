# Telecom ETL Project

## Description
An SSIS ETL package that processes telecom transaction CSV files every 5 minutes. The system reads customer movement data, applies data transformations and validation rules, loads valid records into a database, and handles rejected records separately.

## What I Built
- **SSIS Package** that processes CSV files with telecom transaction data
- **Data transformations** including IMSI lookups, IMEI parsing (TAC/SNR), and data validation
- **Error handling** system that captures rejected records with reasons
- **File management** that moves processed files to archive folder
- **Database tables** for storing valid transactions and rejected records

## Key Features
- Automatic processing every 5 minutes
- Data quality validation (reject nulls for critical fields)
- IMSI reference table lookup for subscriber mapping  
- IMEI parsing to extract TAC and SNR components
- Comprehensive error logging and rejected record tracking

## How to Run

### Prerequisites
- Visual Studio 2022
- SQL Server 2014
- SSIS package installed

### Setup Steps
1. **Run Database Setup**
   - Execute all SQL queries in the `SQL Queries` folder
   - This will create the necessary database tables and structure

2. **Configure SSIS Package**
   - Open the project in Visual Studio 2022
   - Go to Control Flow window
   - Update all variable paths to match your local environment:
     - Input folder path (where CSV files are located)
     - Archive folder path (where processed files will be moved)
     - Any other file system paths

3. **Update Connection Managers**
   - Configure database connection string for SQL Server 2014
   - Set CSV file source connections

### Execution
- Run the package directly from Visual Studio 2022
- Or deploy to SQL Server and schedule via SQL Server Agent

## Project Structure
Telecom-ETL-SSIS/
├── SQL Queries/                  # Database setup scripts
│   ├── 01. Create database.sql
│   ├── 02. Create fact transaction table.sql
│   ├── 03. Create error destination output.sql
│   └── 04. Create dim imsi.sql
├── Source Files/                 # Sample CSV data files
│   ├── 01_clean_data.xlsx
│   ├── 02_clean_data_with_null.xlsx
│   ├── 03_sample_data.xlsx
│   └── batch_01_file_01.xlsx (and other batch files...)
├── Processed Files/              # Archive folder for processed files
├── Telecom-ETL/                  # SSIS project folder
│   ├── Package.dtsx              # Main SSIS package
│   ├── Project.params            # Project parameters
│   ├── Telecom-ETL.database      # Database connection
│   ├── Telecom-ETL.dtproj        # SSIS project file
│   └── Telecom-ETL.dtproj.user   # User-specific project settings                 
└── ETL - Telecom.docx           # Project requirements document
