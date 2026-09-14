import pandas as pd

# Load the dataset
df = pd.read_csv(
    'data/Superstore.csv',
    encoding='latin1'
)

# -----------------------------
# 1. Basic Dataset Inspection
# -----------------------------

print("First 5 rows:")
print(df.head())

print("\nColumns:")
print(df.columns)

print("\nDataset Information:")
df.info()

print("\nMissing Values:")
print(df.isnull().sum())

print("\nStatistical Summary:")
print(df.describe())

# -----------------------------
# 2. Sales Analysis
# -----------------------------

# Total sales
total_sales = df['Sales'].sum()
print("\nTotal Sales:", total_sales)

# Sales by category
sales_by_category = (
    df.groupby('Category')['Sales']
    .sum()
    .sort_values(ascending=False)
)

print("\nSales by Category:")
print(sales_by_category)

# Sales by region
sales_by_region = (
    df.groupby('Region')['Sales']
    .sum()
    .sort_values(ascending=False)
)

print("\nSales by Region:")
print(sales_by_region)

# Sales by segment
sales_by_segment = (
    df.groupby('Segment')['Sales']
    .sum()
    .sort_values(ascending=False)
)

print("\nSales by Segment:")
print(sales_by_segment)

# -----------------------------
# 3. Profit Analysis
# -----------------------------

# Total profit
total_profit = df['Profit'].sum()
print("\nTotal Profit:", total_profit)

# Profit by category
profit_by_category = (
    df.groupby('Category')['Profit']
    .sum()
    .sort_values(ascending=False)
)

print("\nProfit by Category:")
print(profit_by_category)

# Profit by region
profit_by_region = (
    df.groupby('Region')['Profit']
    .sum()
    .sort_values(ascending=False)
)

print("\nProfit by Region:")
print(profit_by_region)

# -----------------------------
# 4. Product Analysis
# -----------------------------

# Top 10 products by sales
top_products = (
    df.groupby('Product Name')['Sales']
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("\nTop 10 Products by Sales:")
print(top_products)

# Top 10 products by profit
top_profit_products = (
    df.groupby('Product Name')['Profit']
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("\nTop 10 Products by Profit:")
print(top_profit_products)

# -----------------------------
# 5. Sub-Category Analysis
# -----------------------------

sales_by_subcategory = (
    df.groupby('Sub-Category')['Sales']
    .sum()
    .sort_values(ascending=False)
)

print("\nSales by Sub-Category:")
print(sales_by_subcategory)

profit_by_subcategory = (
    df.groupby('Sub-Category')['Profit']
    .sum()
    .sort_values(ascending=False)
)

print("\nProfit by Sub-Category:")
print(profit_by_subcategory)

# -----------------------------
# 6. Discount Analysis
# -----------------------------

average_discount = df['Discount'].mean()

print("\nAverage Discount:", average_discount)

# Profit by discount level
profit_by_discount = (
    df.groupby('Discount')['Profit']
    .sum()
    .sort_values(ascending=False)
)

print("\nProfit by Discount Level:")
print(profit_by_discount)

# -----------------------------
# 7. Quantity Analysis
# -----------------------------

total_quantity = df['Quantity'].sum()

print("\nTotal Quantity Sold:", total_quantity)

quantity_by_category = (
    df.groupby('Category')['Quantity']
    .sum()
    .sort_values(ascending=False)
)

print("\nQuantity Sold by Category:")
print(quantity_by_category)