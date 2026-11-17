# razilian E‑Commerce Data Analysis Project

> 
> End‑to‑end SQL‑driven business analysis | Portfolio for Data Analyst / Business Analyst internship & co‑op

## Project Overview

This project analyses the Brazilian E‑Commerce Public Dataset (Olist) using MySQL. It explores sales performance, customer purchasing behaviour, product‑category performance, geographic sales distribution and order fulfilment logistics.

The goal is to transform raw transactional e‑commerce data into practical business insights following a real‑world data‑analyst workflow: business‑driven question definition, database setup, data quality assessment, data cleaning, exploratory SQL analysis and final business reporting.
**SQL was used for data cleaning and exploratory analysis. Power BI was utilized to build an interactive three‑page dashboard for business insight visualization.**

## Database Information

- Database: `ecommerce_analytics`
- DBMS: MySQL
- SQL Client: DBeaver
- Source Dataset: Brazilian E‑Commerce Public Dataset (Olist)

Database Tables
Table	Description
customers	Customer information and geographic details
orders	Order information and timestamps
order_items	Products purchased within each order
payments	Payment methods and transaction amounts
reviews	Customer reviews and ratings
products	Product attributes and categories
sellers	Seller information and locations
geolocation	Geographic coordinates associated with ZIP codes
product_category_translation	Portuguese‑to‑English product category mapping

Project File Structure
Olist-E-Commerce-Analysis/
├── sql_scripts/
│   ├─ 01_database_setup.sql
│   ├─ 02_data_exploration.sql
│   ├─ 03_data_cleaning.sql
│   ├─ 04_sales_analysis.sql
│   ├─ 05_customer_analysis.sql
│   ├─ 06_product_analysis.sql
│   └─ 07_summary_report.sql
├── powerbi_screenshots/
│   ├─ page1.png
│   ├─ page2.png
│   └─ page3.png
├── dax_measures.txt
└── README.md

SQL Modules
File	Analysis Scope
01_database_setup.sql	Create database and relational table schemas
02_data_exploration.sql	Dataset overview: row counts, missing values, duplicate & referential‑integrity checks
03_data_cleaning.sql	Deduplication and handling of data‑quality issues
04_sales_analysis.sql	Overall sales, monthly trends, MoM growth with window functions, AOV, payment‑method breakdown
05_customer_analysis.sql	Unique‑customer segmentation, repeat‑purchase‑rate calculation, geographic sales analysis
06_product_analysis.sql	Product‑category revenue & order volume, top‑selling products, average category price
07_summary_report.sql	Aggregate consolidated business metrics

## Dashboard Introduction

1. **Executive Summary (page1.png)**
Overall business KPIs, monthly revenue & order trends, payment method distribution.
2. **Sales & Product Performance (page2.png)**
Top‑revenue product categories, highest‑revenue states, monthly revenue composition across categories.
3. **Customer & Order Performance (page3.png)**
Order status breakdown, customer geographic distribution, monthly delivered‑order performance.
/Users/xuanqicheng/Desktop/page1.png
/Users/xuanqicheng/Desktop/page2.png
/Users/xuanqicheng/Desktop/page3.png

## Key SQL Skills Demonstrated

- Basic querying & filtering (`SELECT`, `WHERE`, `ORDER BY`)
- Aggregation (`GROUP BY`, `HAVING`)
- Multi‑table joins (`INNER JOIN`, `LEFT JOIN`)
- Subqueries & Common Table Expressions (CTEs)
- Conditional logic (`CASE WHEN`)
- Window functions (`LAG`, `ROW_NUMBER`, `RANK`) for month‑over‑month growth and ranking
- Date‑time transformation
- Systematic data‑quality validation: duplicates, missing values, orphan‑record / referential‑integrity checks

## How to Run

1. Prepare original Olist CSV dataset files (download from Kaggle).
2. Connect to local MySQL instance via DBeaver.
3. Execute `01_database_setup.sql` to create database and table structures.
4. Import corresponding CSV source data into each table.
5. Run `02_data_exploration.sql` for full data‑quality assessment.
6. Execute `03_data_cleaning.sql` to generate cleaned working dataset.
7. Run analysis scripts `04‑06` for sales, customer and product exploratory analysis.
8. Execute `07_summary_report.sql` to output consolidated business metrics.
9. Load cleaned dataset into Power BI, use DAX measures in `dax_measures.txt` to build interactive dashboard.

## Project Deliverables

- Relational MySQL database schema with nine tables
- Systematic data‑quality assessment including missing‑value, duplicate and logical‑integrity checks
- Cleaned dataset for downstream analysis
- Full SQL analysis covering sales trends, customer retention, geographic distribution and product performance
- Interactive 3-page Power BI dashboard for visualizing business metrics
- Complete analytical PDF report with measurable metrics and actionable business recommendations

## Core Business Insights

1. Total marketplace payment revenue reaches **R$16,008,872.12** with average order value of **R$154.10**. Revenue growth is primarily driven by increasing order volume, while average order value remains stable.
2. Repeat‑purchase rate is only ~3.1%: the vast majority of customers are one‑time buyers; customer retention represents a major growth opportunity.
3. Sales are heavily geographically concentrated in Southeast Brazil (SP, RJ, MG), together contributing ~62.55% of total revenue. Remote northern states face longer delivery lead‑times.
4. Credit cards dominate revenue at 78.34% of total payment value, followed by Boleto.
5. Health & Beauty is the highest‑revenue product category; high‑price categories such as Computers show high unit value but low transaction volume.
6. 97.02% of orders are successfully delivered. Late delivery correlates with lower customer review scores, though correlation does not equal causation.

## Business Recommendations

- Boost AOV with product bundling and cross‑selling campaigns, since revenue growth mainly comes from new‑customer acquisition.
- Implement post‑purchase engagement and retention incentives to improve the low repeat‑purchase rate.
- Prioritize marketing and inventory resources for top‑performing categories; run targeted promotions for high‑price, low‑volume categories.
- Optimize logistics partnerships for remote northern Brazilian states to mitigate delivery delays.
- Maintain stable credit‑card payment infrastructure while monitoring adoption of alternative payment methods such as Boleto.

> 
> Full detailed analysis: see `/Report/olist_ecommerce_sql_business_analysis_report.pdf`
> DAX calculations for Power BI dashboard: `dax_measures.txt`
