# 🛒 E-Commerce Funnel & Product Performance Analysis

## 📌 Overview
This project analyzes user behavior across the e-commerce funnel and evaluates product performance using Google Analytics (GA) data. The goal is to identify key drop-off points, uncover product-level inefficiencies, and generate actionable recommendations to improve conversion.

---

## 🎯 Objectives
- Identify drop-off points across the user funnel (view → cart → checkout → purchase)
- Evaluate product performance to detect high- and low-performing items
- Analyze user behavior patterns using session-level data
- Provide data-driven recommendations to improve conversion efficiency

---

## 🗂️ Dataset
- Source: Google Analytics (BigQuery public dataset)
- Granularity: Session-level and product-level
- Key variables:
  - `fullVisitorID`, `visitId`, `visit_date`
  - `device`, `trafficSource`, `country`
  - `product_name`
  - `eCommerceAction.action_type`

---

## ⚙️ Data Processing
- Flattened nested GA data using `UNNEST`
- Selected relevant variables for funnel and product analysis
- Transformed action codes into binary funnel indicators:
  - `2 = product_view`
  - `3 = add_to_cart`
  - `5 = checkout`
  - `6 = purchase`
- Performed data cleaning (date parsing, null checks, deduplication)

---

## 🧱 Data Structure
The dataset is structured into four analytical tables:

- **funnel_session** → Session-level funnel progression  
- **product_performance** → Product-level interaction data  
- **product_summary_count** → Aggregated product metrics (no funnel constraint)  
- **product_summary_funnel** → Aggregated metrics with sequential funnel logic  

---

## 📊 Analysis & Dashboard
The analysis is conducted using Python and visualized in Tableau.

### Key Analysis Areas:
- Funnel drop-off and conversion behavior  
- Device-based performance differences  
- Product-level performance (high view vs low conversion)  
- User behavior patterns  

### Dashboard:
Includes:
- Funnel visualization  
- Conversion rates by device and traffic source  
- Product insights (top products, problematic products)  
- User behavior analysis  

---

## 🔍 Key Insights
- Significant drop-off occurs at early funnel stages (view → cart)
- Mobile users show lower conversion compared to desktop
- Several high-traffic products have low conversion rates
- High-intent users are not effectively re-engaged

---

## 🚀 Recommendations
- **Frictionless Checkout Optimization** → Reduce unnecessary steps and enable direct checkout  
- **Behavior-Based Retargeting** → Re-engage high-intent users through personalized campaigns  
- **Product & Pricing Optimization** → Improve product presentation and value perception  

---

## 🛠️ Tech Stack
- **Data Warehouse:** BigQuery  
- **Analysis:** Python (Pandas, Matplotlib)  
- **Visualization:** Tableau  

---

## 📈 Business Impact
This project demonstrates how structured data analysis can uncover inefficiencies in user behavior and product performance, enabling businesses to improve conversion without increasing traffic acquisition.

---

## 📎 Author
Nurul – Aspiring Data Analyst / Data Scientist
