# Power BI dashboard build kit

This folder defines a polished four-page Power BI dashboard for `data/Superstore.csv`. It is intentionally source-controlled as text so the model logic and report decisions can be reviewed in Git.

## Open it in Power BI Desktop

1. Install and open Power BI Desktop.
2. Select **Get data > Blank query > Advanced Editor** and replace the query with [`power-query/Sales.pq`](power-query/Sales.pq).
3. In the query, update `FilePath` to the absolute path of `data/Superstore.csv` on your computer, then name the query **Sales** and load it.
4. Create the Date table from [`dax/date-table.dax`](dax/date-table.dax), then mark `Date[Date]` as a date table and relate `Date[Date]` to `Sales[Order Date]`.
5. Create the measures in [`dax/measures.dax`](dax/measures.dax). Apply the model notes in [`model/model-notes.md`](model/model-notes.md).
6. Import [`theme/business-sales-theme.json`](theme/business-sales-theme.json) via **View > Themes > Browse for themes**.
7. Build the pages and visuals in [`report-blueprint.md`](report-blueprint.md), save the result as `Business-Sales-Analytics.pbix` in this folder, and commit it only if its size is appropriate for Git.

## Dashboard scope

| Page | Purpose |
| --- | --- |
| Executive Overview | KPIs, sales/profit trend, regional and category performance |
| Product Performance | Product, sub-category, and category profitability |
| Geography & Customers | Regional, state, segment, and customer results |
| Discounts & Shipping | Margin risk by discount band and shipping-mode outcomes |

## Validation targets

After refreshing, the headline values should be approximately:

| Metric | Expected |
| --- | ---: |
| Total sales | $2,297,201 |
| Total profit | $286,397 |
| Profit margin | 12.47% |
| Orders | 5,009 |
| Customers | 793 |
| Quantity | 37,873 |

The negative-profit sub-categories should include Tables, Bookcases, and Supplies. These checks help catch an incorrect date locale, broken relationship, or wrong data source.
