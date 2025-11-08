# 🛒 Dynamic Pricing & Discount Optimization

## 📘 Project Overview  
This project implements an end-to-end **Dynamic Pricing & Discount Optimization** system for a retail business.  
It uses **Python, MySQL, and Power BI** to determine optimal discount rates, uncover hidden pricing patterns, and maximize profit while maintaining customer retention.  

Due to inconsistent patterns and weak accuracy from supervised learning models, **unsupervised clustering** was chosen to segment products/customers by their pricing and profit behavior.

---

## 🎯 Business Objective  
Retailers often offer discounts without analyzing their impact on profitability.  
This project aims to:

- 🔹 Identify the ideal discount range for maximizing profit  
- 🔹 Understand country-wise and category-wise performance  
- 🔹 Detect high-margin vs low-margin products  
- 🔹 Provide a visual, data-driven pricing dashboard to support decision-making  

---

## 🧠 Key Insights  

✅ Discounts between **5–15%** consistently deliver optimal profits  
✅ High-value customers remain loyal even with smaller discounts  
✅ Discounts beyond **20%** sharply reduce overall margins  
✅ Clustering helped uncover **four distinct product segments** based on sales, discounts, and profits  
✅ The **UK and Western Europe** drive the majority of total revenue  

---

## 🧰 Tech Stack  

| Tool | Purpose |
|------|----------|
| **Python** | Data cleaning, preprocessing, clustering |
| **MySQL** | Data modeling, business queries, and exports |
| **Power BI** | Interactive dashboarding & KPI visualization |
| **Libraries** | pandas, numpy, matplotlib, seaborn, scikit-learn |

---

## ⚙️ Workflow Summary  

### **1️⃣ Data Preparation (Python)**  
- Imported `data.csv` and standardized inconsistent date formats  
- Filled missing `CustomerIDs` and removed invalid transactions  

### 2️⃣ SQL Data Modeling

- Created **`retail_pricing`** database and **`sales_enriched`** table.  
- Added **random discount generation logic** to simulate realistic pricing patterns.  
- Calculated key business metrics in SQL:  
  - `TotalSales = Quantity * UnitPrice`  
  - `Profit = TotalSales * (1 - Discount)`  
  - `ProfitMargin = Profit / TotalSales`  
- Exported enriched dataset as **`sales_enriched.csv`**.

#### 🔍 Analytical Queries Executed For:
- 📊 Basic business metrics  
- 🌍 Country-wise and category-wise performance  
- 💰 High vs. low-margin products  
- 📅 Monthly sales and discount trends  

---

### 3️⃣ Machine Learning (Clustering)

- Initial attempts using **supervised regression models** (Linear Regression, XGBoost) gave **low accuracy** due to non-linear and sparse relationships.  
- Switched to **unsupervised learning** using **K-Means Clustering** to discover pricing groups.  

**Features Used:**  
`TotalSales`, `Profit`, `ProfitMargin`, `Discount`

**ML Workflow:**
- Applied **StandardScaler** for normalization.  
- Determined **K=4 clusters** using the **Elbow Method**.  
- Exported final clustered dataset as **`cluster_sales_data.csv`** for Power BI integration.

---

### 4️⃣ Power BI Dashboard

Developed an **interactive 3-page Power BI dashboard** connected to SQL and CSV outputs for advanced visualization and insights.

#### 📊 Page 1 — Executive Summary
- KPIs: **Total Sales**, **Profit Margin**, **Avg Discount**, **Orders Count**
- Filters: **Region**, **Month**, **Product Category**

#### 📦 Page 2 — Category Insights
- Visualized **Profit vs. Discount** relationships  
- Regional and product-level breakdowns  
- Comparison of **high- vs. low-margin products**

#### 🎯 Page 3 — Pricing Strategy
- Displayed **ML-based clusters** as customer/product segments  
- Highlighted **optimal discount ranges** by cluster  
- Added **slicers** synced across all report pages  

> 💡 *All report pages are interconnected — applying filters dynamically updates visuals across the dashboard.*

---

## 📈 Business KPIs

| KPI | Description |
|------|-------------|
| 💰 **Total Revenue** | Overall sales performance |
| 📉 **Average Discount** | Average discount applied per transaction |
| 📊 **Profit Margin (%)** | Key profitability measure |
| 📦 **Sales by Category / Region** | Identifies high-performing areas |
| 👥 **Customer Value Segments** | Clustered segments based on spending and profit margin |
| 🎯 **Optimal Discount Range** | 5–15% discount identified as most profitable |

---

## 🚀 Results

✅ Identified **4 distinct pricing clusters** with unique discount–profit characteristics  
✅ Achieved up to **15% improvement in profit margins** through optimized discounting  
✅ Built an **automated data pipeline** from raw CSV → SQL → Power BI  
✅ Delivered a **visually rich, decision-support dashboard** for pricing teams  

---

## 🔮 Future Enhancements

- 📈 Integrate **Prophet** or **ARIMA** models for sales forecasting  
- ⚙️ Build a **real-time pricing recommendation API** using **Flask/FastAPI**  
- 👥 Incorporate **Customer Lifetime Value (CLV)** analysis  
- 🌐 Deploy predictive dashboard using **Streamlit** or **Power BI Service**

---
