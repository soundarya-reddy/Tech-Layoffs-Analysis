# Tech Layoffs Analysis (2020–2025)

This project analyzes global technology layoffs using SQL and Power BI to identify key trends across companies, industries, and locations. The dataset was cleaned in Excel, analyzed using SQL queries, and visualized through an interactive dashboard.

## Project Workflow
### 1. Data Cleaning (Excel)
The dataset was cleaned and standardized before analysis:<br>
Replaced missing values in Company and Location columns with "Unknown".

Standardized location values:<br>
- US, USA, San Francisco, Seattle, New York → United States
- UK, London → United Kingdom
- Converted Funds Raised values to numeric format<br>
Example: 100M → 100000000.

Filled blank values:
- Laid_off → 0
- Funds_Raised → 0
- percentage_laid_off → 0
- Converted percentage values like 2.39 into decimal format 0.0239.
- Standardized Date format to YYYY-MM-DD.

#### Database Setup
Data was imported into MySQL for analysis.<br>
Example setup:<br>

CREATE DATABASE TECH_LAYOFFS;<br>
USE TECH_LAYOFFS;<br>
SELECT * FROM layoffs;

### SQL Analysis Queries
Key analysis queries included:<br>

#### Total Layoffs:<br>
SELECT SUM(Laid_off) AS total_layoffs<br>
FROM layoffs;

#### Top 10 Companies by Layoffs:<br>
SELECT company, SUM(laid_off) AS layoffs<br>
FROM layoffs<br>
WHERE company != 'Unknown'<br>
GROUP BY company<br>
ORDER BY layoffs DESC<br>
LIMIT 10;

#### Layoffs by Location:<br>
SELECT location, SUM(laid_off) AS layoffs<br>
FROM layoffs<br>
GROUP BY location<br>
ORDER BY layoffs DESC;<br>

#### Monthly Layoff Trend:
SELECT DATE_FORMAT(Date,'%Y-%m') AS month,<br>
SUM(Laid_off) AS total_layoffs<br>
FROM layoffs<br>
GROUP BY Month<br>
ORDER BY Month;

#### Layoffs by Stage:<br>
SELECT stage, SUM(laid_off) AS layoffs<br>
FROM layoffs<br>
GROUP BY stage<br>
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
- Layoffs by Industry – Column Chart
- Layoff Trend Over Time – Line Chart 
  
#### Interactive Filters
- Year
- Location
- Stage

![Dashboard]<img width="1171" height="674" alt="image" src="https://github.com/user-attachments/assets/36b29391-a95c-4f40-ad7c-f34bc75e042b" />


### Key Insights
- Technology companies experienced significant layoffs during economic slowdowns.
- Layoffs were concentrated in specific geographic locations and funding stages.
- Monthly trend analysis revealed periods of major workforce reductions.

### Tools Used
- Excel (Data Cleaning)
- MySQL
- Microsoft Power BI
- GitHub
### 👩‍💻 Author & Contact
Soundarya Kasale<br>
Aspiring Data Analyst<br>
Email: soundaryareddy463@gmail.com<br>
[LinkedIn](https://www.linkedin.com/in/soundarya-reddy-8b5584397/)


