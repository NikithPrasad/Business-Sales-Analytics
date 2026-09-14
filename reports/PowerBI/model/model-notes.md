# Model setup

- Keep `Sales` as the fact table and use `Row ID` only as a technical identifier.
- Create a one-to-many, single-direction relationship from `Date[Date]` to `Sales[Order Date]`.
- Mark `Date` as the model date table. Sort `Date[Month]` by `Date[Month Number]` and `Date[Year Month]` by `Date[Year Month Sort]`.
- Format Sales and Profit measures as currency with zero decimal places; format Margin and YoY measures as percentages with one decimal place.
- Hide `Row ID`, `Postal Code`, `Product ID`, and raw numeric columns from report view after their measures are created to keep the field pane clean.
