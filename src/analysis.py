import pandas as pd
import matplotlib.pyplot as plt
df = pd.read_csv('data/Superstore.csv', encoding='latin1')
print(df.head())
print(df.columns)
df.info()
print(df.isnull().sum())
print(df.describe())
sales_by_category = df.groupby('Category')['Sales'].sum().sort_values(ascending=False)
print(sales_by_category)
print(type(df))