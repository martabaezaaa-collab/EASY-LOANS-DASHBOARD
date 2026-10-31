# Easy Loans: Loan Portfolio Analysis (SQL + Tableau)

End-to-end analytics project built as the final assignment of the Business Analytics & Big Data master's programme (UNED / NTIC Master). It covers the full data lifecycle: querying and modelling data in Snowflake, then turning it into an interactive Tableau dashboard with business recommendations.

Academic project. The dataset belongs to a fictional consumer-finance company, "Easy Loans", which provides point-of-sale loans through merchants across several European countries.

## Business questions
Which countries generate the most loan operations, and how does the average loan amount vary by country and status (active, closed, delinquent, cancelled)?
Which merchants drive the most operations, and which ones accept refunds?
Where are the risks (delinquency, cancellations) and where are the opportunities?

## Data

Three tables in Snowflake:

Table	Content
orders	Loan operations: id, date, status, amount, merchant, country
merchants	Merchant id and name
refunds	Refunds linked to orders: date and amount
What I did
1. SQL analysis (Snowflake)
Operations by country and status: aggregations, filters by date, country and amount range, ordered by average amount.
Top 3 most active countries: total operations, max and min amounts, excluding delinquent and cancelled loans.
Merchant performance: joins between orders, merchants and refunds; CASE WHEN to flag whether a merchant accepts refunds; HAVING to keep merchants with more than 10 sales.
Consolidated view (easy_loans_view): one view combining orders, merchants and refund counts/amounts, exported to CSV as the source for Tableau.

Every query is accompanied by a short write-up: findings, business impact and recommendation (see the PDF report).

2. Business Intelligence (Tableau)
Data model on the exported CSV, filtered to European operations.
Calculated fields: average, max, min, total merchants, running sum (cumulative value), fixed average (FIXED LOD), total refunds.
A parameter ("Minimum loan value") that filters every visualisation in the dashboard.
Visualisations: KPI table, country map coloured by average loan, cumulative area chart by day and country, and a deviation view (above/below average).
Dashboard interactions: global filters (country, date range, minimum loan) and a map action that filters the other views.
Key insights

Replace these with the figures from your own results before publishing.

Spain is the most active market by number of operations, but it also concentrates the largest number of loans with pending payments, so growth there should go together with delinquency control.
Portugal has the lowest volume of operations, so it does not currently contribute much to the business.
Activity differs a lot by merchant, which suggests focusing commercial efforts on the top-performing merchants and reviewing those with low activity or many refunds.
Tools

SQL · Snowflake · Tableau Desktop · Tableau Public

Repository contents
/sql         SQL queries for each exercise
/tableau     Tableau workbook (.twbx)
/report      Final report (PDF) with queries, reflections and dashboard screenshots
Links
Interactive dashboard: add your Tableau Public link here
Full report: see /report
Author

Your Name · LinkedIn · your.email@example.com
