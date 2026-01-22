# SaaS Customer Churn Analysis 

## Project Overview
This project analyzes customer churn in a subscription-based SaaS business using account, subscription, and product usage data.
The objective is to understand when churn occurs, why customers churn, and which users should be prioritized for retention, with a focus on early lifecycle behavior.

The analysis combines **SQL-based churn metric computation**, **Python-driven exploratory and cohort analysis, behavioral feature engineering, and churn risk modeling** to translate raw usage data into actionable retention insights.
The final output includes analytical notebooks, a dashboard, and an executive presentation.

---

## Dataset
- **Source:** SaaS Subscription & Churn Analytics Dataset (Kaggle)
- **Type:** Synthetic dataset
- **Time Period:** January 2023 – December 2024  

The dataset contains information on:
- Customer accounts and signup metadata
- Subscription lifecycles and billing attributes
- Product feature usage logs
- Churn events and churn timing

---

## Tools & Technologies
- **SQL (SQLite):**
   - Data storage and transformation
   - Monthly churn and active account views
- **Python (pandas, numpy, scikit-learn, matplotlib,seaborn):**  
  - Exploratory Data Analysis (EDA)  
  - Cohort analysis and retention modeling
  - Behavioral feature engineering
  - Churn risk modeling (logistic regression) 
- **Power BI & Tableau:** Interactive dashboards  
- **PowerPoint:** Executive presentation of insights  

---

## Data Modeling
- Raw CSV files were loaded into a SQLite database
- Tables modeled at the account and subscription level
- SQL views created for:
   - Monthly churned accounts
   - Active accounts at period start
   - Monthly churn rate


---

## Analytical Approach

### Exploratory Data Analysis (EDA)
- Analyzed monthly churn trends and active account growth
- Identified a structural increase in churn in recent periods
- Examined churn distribution by:
   - Trial vs non-trial users
   - Industry and geography

**Key takeaway:** churn was not random and warranted deeper lifecycle analysis.

### Cohort Analysis
- Built signup-month cohorts at the account level
- Computed cohort retention rates using an `is_retained` indicator
- Analyzed retention curves and heatmaps to identify lifecycle patterns

**Key finding:** A large proportion of churn occurs within the first 90 days after signup, making early lifecycle behavior critical.

### Behavioral Feature Engineering
- Early-life behavior was aggregated to one row per account using the first 30 days after signup:
- Engagement metrics:
   - Active days
   - Usage events
   - Features used
- Friction metrics:
   - Error counts
   - Errors per active day
- **Accounts were segmented into activation-based behavioral cohorts (low, medium, high)**

### Behavioral Cohort Analysis
- Compared early churn rates across activation cohorts
- Found that higher engagement did not guarantee retention
- Highly engaged users experienced more errors, leading to higher churn
- **This revealed that churn was driven by product friction during usage, not lack of activation.**

### Churn Risk Modeling
- Trained an interpretable logistic regression model using early behavioral features
- Generated churn risk scores for trial users
- Segmented users into high-risk vs low-risk groups
- Result:
   - **~70% of high-risk users churned early**
   - **~21% of low-risk users churned early**

> Note: The model was used as a prioritization tool, not a production predictor.

### Retention Strategy & Experiment Design
- Based on analytical findings, a targeted retention strategy was defined:
   - Focus on high-risk trial users
   - Intervene within the first 30 days
   - Reduce early product friction (errors, unstable feature exposure)
- An A/B testing framework was designed to validate whether targeted interventions reduce early churn, including:
   - User randomization logic
   - Success metrics
   - Statistical evaluation plan


---

## Dashboards

Five interactive dashboards were built in **Power BI**, following a decision-driven analytical flow from churn detection to action planning.

### Dashboard 1 — Churn Trend & Structural Shift
- Monthly churn rate trend with annotated inflection point (early 2024)
- Active accounts at start of month
- Monthly churned accounts
- **Identifies whether churn is worsening structurally over time**

### Dashboard 2 — Cohort Retention Breakdown
- Cohort retention heatmap (signup month × months since signup)
- Retention curves comparing pre-2024 vs post-2024 cohorts
- **Evaluates whether rising churn is driven by weaker cohort retention**

### Dashboard 3 — Early-Life Churn Diagnostics
- Early churn rates (90-day)
- Retention comparison: trial vs non-trial users
- **Focuses on identifying the population for churn diagnostics**

### Dashboard 4 — Usage Intensity, Errors & Product Friction
- Early churn rate by activation bucket
- Errors per active day by activation level
- Feature-level error analysis highlighting product friction
- Exploratory behavioral analysis on trial users (n = 67)

### Dashboard 5 — Risk Focus & Action Planning
- Comparison of high-risk vs low-risk account behavior
- Dominant error-driving features for high risk accounts
- Action-ready insights to prioritize users and product fixes for retention improvement

---

## Key Business Insights

- Product friction is a major driver of early churn
- High engagement alone does not prevent churn
- Behavioral segmentation outperforms static attributes (plan tier, industry)
- Churn risk is concentrated in a small subset of users
- Risk-based targeting enables higher ROI retention efforts

---

## Business Recommendations
- Prioritize retention interventions within the first 30 days
- Focus on reducing early product friction, not just increasing usage
- Target high-risk users rather than broad user populations
- Use churn risk scores to guide experimentation and customer outreach
- Monitor early error metrics as leading churn indicators

---

## Local Setup (Optional)

This project can be reproduced locally using SQLite and VS Code.

### Prerequisites
- Python 3.x
- VS Code
- Power BI Desktop and/or Tableau (for dashboard viewing)

### Steps
1. Open the project folder in VS Code.
2. Install the **SQLTools** extension and the **SQLite driver**.
3. Create a SQLite connection pointing to the local database file (`saas.db`).
4. Run the SQL scripts in the `sql/` folder to create tables and preprocess data.
5. Open the Jupyter notebooks in the `notebooks/` folder to reproduce the analysis.
6. Open the dashboard files from the `dashboards/` folder to explore insights.

> Note: The database is not included in the repository due to size.  
> Instructions to recreate the database are provided via SQL Queries.
