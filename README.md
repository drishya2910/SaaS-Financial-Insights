# SaaS-Financial-Insights
End-to-end SaaS financial analysis using Excel, SQL, and Power BI to evaluate revenue performance, cost structure, and profitability, delivering actionable business insights.
# SaaS Financial Insights – End-to-End Data Analysis Project

Amazon SaaS Profitability Analysis
## Objective
Analyze SaaS financial performance using Excel, SQL, and Power BI to derive actionable business insights.

## Tools Used
- Excel (Data cleaning & financial modeling)
- SQL (Querying & analysis)
- Power BI (Dashboard & visualization)

## Repository Structure
- Raw data
- Documentation
- SQL queries
- Power BI dashboard

Business Context
Despite strong sales volumes, the SaaS business shows uneven and declining profitability across regions and industries. Leadership requires clarity on:
1) Which segments destroy value
2) Where discounts become dangerous
3) Which customers are truly “ideal” from a profitability standpoint

Dataset Overview
Scope: 2,500 validated global transactions
Regions: AMER, EMEA, APJ
Industries: Energy, Finance, Tech, Healthcare, Manufacturing, Retail, etc.
Core Metrics: Sales, Discount, Profit
Outlier analysis revealed extreme negative-profit transactions, signaling discount misuse.

Analytical Approach
SQL used for aggregation, segmentation, and profitability modeling
Excel used for validation and summary analysis 
Created a model-ready table (saas_model_ready) to preserve raw data integrity

Engineered Metrics
Profit Margin (%) = (Profit / Sales) × 100

Discount Strategy Buckets
None (0%)
Standard (1–20%)
Aggressive (30%+)

Key Analysis & Insights
1. Segment Profitability (Industry × Region)
High sales volume ≠ high business value
Energy and Finance segments consistently deliver positive margins
APJ region shows repeated loss-making behavior across multiple industries
SMB-heavy segments generate revenue but frequently erode profit
Conclusion:
A smaller, high-margin customer base is more valuable than large, loss-making volume.

2. Discount Sensitivity Analysis
Clear negative correlation between discount level and profitability
Transactions with 0–20% discounts remain profitable
Beyond 30% discount, margins turn negative
Extreme cases show margins as low as –181%, meaning the company loses more than it earns per sale
Conclusion:
Discounting is the primary driver of profit loss.

Business Evaluation

Findings are consistent across order sizes and regions
Results align with known SaaS “loss leader” risks
Current strategy favors market share over financial sustainability
Actionable Recommendations
Enforce a 20% discount ceiling across sales operations
Prioritize Energy and Finance sectors for growth
De-emphasize loss-making segments despite high sales volume
Implement transaction-level monitoring to flag high-risk discounts in real time

Outcome
This project delivers a data-backed pricing policy, a clear definition of the ideal customer profile, and a framework for profit-first decision-making in SaaS operations.

An executive-level profitability dashboard built in Power BI to monitor:

Profit and margin impact by discount strategy
Industry and region-level profit contribution
Customer-level profit concentration
Real-time risk alerts for loss-making scenarios
