# Report blueprint

Use a 16:9 canvas, a white background, and the supplied theme. Place slicers consistently across the top: `Date[Year]`, `Sales[Region]`, and `Sales[Segment]`.

## 1. Executive Overview

- Four KPI cards: **Total Sales**, **Total Profit**, **Profit Margin**, and **Order Count**. Add Sales YoY % as the Total Sales card reference label.
- Line and clustered-column chart: `Date[Year Month]` on the axis, **Total Sales** as columns, **Total Profit** as line.
- Clustered bar chart: `Sales[Category]` by **Total Sales** and **Total Profit**.
- Filled map (or bar chart when maps are unavailable): `Sales[State]` by **Total Sales**; use Region as the legend/filter.
- Matrix: `Sales[Region]` rows, **Total Sales**, **Total Profit**, **Profit Margin**, and **Order Count** values. Apply conditional formatting to profit and margin.

## 2. Product Performance

- Bar chart: `Sales[Sub-Category]` by **Total Profit**, sorted ascending, with negative bars in red.
- Treemap: `Sales[Category]` > `Sales[Sub-Category]` by **Total Sales**.
- Table: `Sales[Product Name]`, **Total Sales**, **Total Profit**, **Profit Margin**, **Total Quantity**. Filter to Top N 10 by Total Sales.
- Scatter chart: **Total Sales** (X), **Total Profit** (Y), `Sales[Sub-Category]` details, **Total Quantity** size. Add zero reference lines.
- Card: **Loss-Making Products**.

## 3. Geography & Customers

- Bar chart: `Sales[Region]` by **Total Sales** and **Total Profit**.
- Map: `Sales[State]` location and **Total Profit** bubble size. Add state and city tooltips.
- Column chart: `Sales[Segment]` by **Total Sales**.
- Table: `Sales[Customer Name]`, `Sales[Segment]`, **Total Sales**, **Total Profit**, **Order Count**. Filter Top N 15 by Total Sales.
- Decomposition tree: Analyze **Total Profit** by Region, Category, and Sub-Category.

## 4. Discounts & Shipping

- Combo chart: `Sales[Discount Band]` on the axis, **Total Sales** columns, **Total Profit** line.
- Bar chart: `Sales[Ship Mode]` by **Total Sales** and **Profit Margin**.
- Column chart: `Sales[Discount Band]` by **Profit Margin**; color any negative values red.
- Table: `Sales[Sub-Category]`, **Average Discount**, **Total Profit**, **Profit Margin**, **Average Shipping Days**.
- Insight text box: “Tables, Bookcases, and Supplies are loss-making sub-categories. Investigate their discount policies before increasing volume.”

## Interaction and accessibility

- Turn on cross-filtering for category, region, and discount visuals.
- Add descriptive titles that change with filters, e.g. “Sales and Profit by Month”.
- Set an alt text description for each visual and avoid relying on color alone to distinguish loss from profit.
