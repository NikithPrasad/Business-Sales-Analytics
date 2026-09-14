# Business Sales Analytics

Sales and profitability analysis for the Sample Superstore dataset (9,994 order lines from 2011–2014).

## Power BI dashboard

The Power BI build kit lives in [`reports/PowerBI`](reports/PowerBI/README.md). It contains the import query, date table, DAX measures, report-page blueprint, and a custom theme so the dashboard can be recreated consistently in Power BI Desktop.

The dashboard is designed to answer:

- How are sales, profit, margin, and order volume trending?
- Which categories, sub-categories, regions, and products drive results?
- Where do discounts erode profitability?
- Which shipping modes and customer segments are most valuable?

## Dataset

`data/Superstore.csv` is the source. Dates are stored as `dd-MM-yyyy`; the included Power Query handles this explicitly.

## Other analysis

- [`src/analysis.py`](src/analysis.py) provides exploratory analysis in Python.
- [`SQL/sales_analysis_full.sql`](SQL/sales_analysis_full.sql) contains Oracle SQL analysis queries.
