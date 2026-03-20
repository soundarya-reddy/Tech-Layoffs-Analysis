# Tech Layoffs Analysis (2020–2025)

This project analyzes global technology layoffs using SQL and Power BI to identify key trends across companies, industries, and locations. The dataset was cleaned in Excel, analyzed using SQL queries, and visualized through an interactive dashboard.

## Project Workflow
### 1. Data Cleaning (Excel)
The dataset was cleaned and standardized before analysis:
Replaced missing values in Company and Location columns with "Unknown".

Standardized location values:
- US, USA, San Francisco, Seattle, New York → United States
- UK, London → United Kingdom

Converted Funds Raised values to numeric format
Example: 100M → 100000000.

Filled blank values:
- Laid_off → 0
- Funds_Raised → 0
- percentage_laid_off → 0
- Converted percentage values like 2.39 into decimal format 0.0239.

Standardized Date format to YYYY-MM-DD.

#### Database Setup
Data was imported into MySQL for analysis.
Example setup:
CREATE DATABASE TECH_LAYOFFS;
USE TECH_LAYOFFS;
SELECT * FROM layoffs;

### SQL Analysis Queries
Key analysis queries included:

#### Total Layoffs:<br>
SELECT SUM(Laid_off) AS total_layoffs 
FROM layoffs;

##### Top 10 Companies by Layoffs:<br>
SELECT company, SUM(laid_off) AS layoffs
FROM layoffs
WHERE company != 'Unknown'
GROUP BY company
ORDER BY layoffs DESC
LIMIT 10;

##### Layoffs by Location:<br>
SELECT location, SUM(laid_off) AS layoffs
FROM layoffs
GROUP BY location
ORDER BY layoffs DESC;

##### Monthly Layoff Trend:
SELECT DATE_FORMAT(Date,'%Y-%m') AS month,
SUM(Laid_off) AS total_layoffs
FROM layoffs
GROUP BY Month
ORDER BY Month;

##### Layoffs by Stage:
SELECT stage, SUM(laid_off) AS layoffs
FROM layoffs
GROUP BY stage
ORDER BY layoffs DESC;

### Power BI Dashboard
The dataset was connected directly from MySQL into Microsoft Power BI.

#### Key KPI Metrics
- Total Employees Laid Off
- Total Companies
- Total Industries
- Total Locations

#### Visualizations
- Top 10 Companies by Layoffs – Horizontal Bar Chart
- Layoffs by Stage – Donut Chart
- Layoffs by Location – Map 

#### Interactive Filters
- Year
- Location
- Stage

### Key Insights
- Technology companies experienced significant layoffs during economic slowdowns.
- Layoffs were concentrated in specific geographic locations and funding stages.
- Monthly trend analysis revealed periods of major workforce reductions.

### Tools Used

- Excel (Data Cleaning)
- MySQL
- Microsoft Power BI
- GitHub



