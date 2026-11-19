# Easy Loans: Loan Portfolio Analysis (SQL + Tableau)

End-to-end analytics project. It covers the full data lifecycle: querying and modelling data in Snowflake, then turning it into an interactive Tableau dashboard with business recommendations.

Academic project. The dataset belongs to a fictional consumer-finance company, "Easy Loans", which provides point-of-sale loans through merchants across several European countries.

## Business questions
- Which countries generate the most loan operations, and how does the average loan amount vary by country and status (active, closed, delinquent, cancelled)?
- Which merchants drive the most operations, and which ones accept refunds?
- Where are the risks (delinquency, cancellations) and where are the opportunities?

## Data

Three tables in Snowflake:

| Table | Content |
|---|---|
| `orders` | Loan operations: id, date, status, amount, merchant, country |
| `merchants` | Merchant id and name |
| `refunds` | Refunds linked to orders: date and amount |

## What I did
### 1. SQL analysis (Snowflake)
#### - Operations by country and status: 
- aggregations
- filters by date, country and amount range
- ordered by average amount
  
  
#### - Top 3 most active countries: 
- total operations
- max and min amounts
- excluding delinquent and cancelled loans
  
  
#### - Merchant performance: 
- joins between orders, merchants and refunds
- CASE WHEN to flag whether a merchant accepts refunds
- HAVING to keep merchants with more than 10 sales
  
  
#### - Consolidated view (easy_loans_view): 
- one view combining orders, merchants and refunds
- exported to CSV as the source for Tableau
  

#### - Every query is accompanied by a short write-up: 
- findings
- business impact
- recommendations

  
  
  

### 2. Business Intelligence (Tableau)
#### - Data model on the exported CSV, filtered to European operations

#### - Calculated fields: 
- average, max, min, total merchants
- running sum (cumulative value)
- fixed average (FIXED LOD)
- total refunds

#### - A parameter ("Minimum loan value") that filters every visualisation in the dashboard.

#### - Visualisations: 
- KPI table
- country map coloured by average loan
- cumulative area chart by day and country
- a deviation view (above/below average)

#### - Dashboard interactions: 
- global filters (country, date range, minimum loan)
- a map action that filters the other views
  



