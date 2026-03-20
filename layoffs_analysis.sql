CREATE DATABASE TECH_LAYOFFS;
USE TECH_LAYOFFS;
select database();

show tables;
SELECT * FROM layoffs;

-- Total Layoffs
SELECT SUM(Laid_off) AS total_layoffs 
FROM layoffs;

-- Layoffs by Location
SELECT location, SUM(laid_off) AS layoffs
FROM layoffs
GROUP BY location
ORDER BY layoffs DESC;

-- Top 10 Companies by Layoffs
SELECT company, SUM(laid_off) AS layoffs
FROM layoffs
WHERE company != 'Unknown'
GROUP BY company
ORDER BY layoffs DESC
Limit 10;

-- Companies with Highest Layoffs per Year
SELECT YEAR(Date) as year ,company,SUM(Laid_off) AS total_layoffs
FROM layoffs
WHERE company != 'Unknown'
GROUP by Year, company
ORDER BY Year, total_layoffs DESC;

-- 5 Monthly Layoff Trend
SELECT Date_Format(Date,'%Y-%m') AS month,
SUM(Laid_off) AS total_layoffs
FROM layoffs
GROUP BY Month
ORDER BY Month;

-- Layoffs by Company Stage
SELECT stage, SUM(laid_off) AS layoffs
FROM layoffs
GROUP BY stage
ORDER BY layoffs DESC;

-- Top 5 Industries with Most Layoffs
SELECT industry, SUM(laid_off) AS layoffs
FROM layoffs
GROUP BY industry
ORDER BY layoffs DESC
LIMIT 5;

-- Companies with 100% Layoffs
SELECT COUNT(*) AS full_layoff_events
FROM layoffs
WHERE percentage_laid_off = 1;

-- Companies with Highest Funding
SELECT company, funds_raised
FROM layoffs
WHERE company != 'Unknown'
ORDER BY funds_raised DESC
LIMIT 10;

-- Layoffs Greater Than 1000
SELECT Company, laid_off
FROM layoffs
WHERE laid_off > 1000 AND company != 'Unknown'
ORDER BY laid_off DESC;

