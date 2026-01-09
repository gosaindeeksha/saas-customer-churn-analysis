-- Query to create view to get number of churned accounts in a month
CREATE VIEW monthly_churned_accs AS
SELECT
    STRFTIME('%Y-%m', churn_date) AS month,
    COUNT(DISTINCT account_id) AS churned_accounts
FROM churn
GROUP BY STRFTIME('%Y-%m', churn_date)
ORDER BY month;

-- Query to check if view has been created
SELECT * FROM monthly_churned_accs;

-- Query to create view to get active accounts at the beginning of the month
CREATE VIEW active_acc_start_of_month AS
SELECT m.month, COUNT(DISTINCT a.account_id) AS active_accounts
FROM (
    SELECT STRFTIME("%Y-%m",signup_date) as month FROM accounts
    UNION
    SELECT STRFTIME("%Y-%m",churn_date) as month FROM churn
) m
JOIN accounts a
ON a.signup_date < DATE(m.month||'-01')
LEFT JOIN churn c
ON a.account_id=c.account_id
WHERE c.churn_date IS NULL OR c.churn_date >=DATE(m.month||'-01')
GROUP BY m.month
ORDER BY m.month
;

-- Query to check if view has been created
SELECT * FROM active_acc_start_of_month ;



-- Query to create view to get monthly churn rate
CREATE VIEW monthly_churn_rate AS
SELECT a.month,COALESCE(m.churned_accounts,0) AS churned_accounts,a.active_accounts, 
ROUND(CAST(COALESCE(m.churned_accounts,0) AS REAL) / a.active_accounts,4) AS monthly_churn_rate
FROM active_acc_start_of_month a 
LEFT JOIN  monthly_churned_accs m
ON a.month = m.month
ORDER BY m.month;

-- Query to check if view has been created
SELECT * FROM monthly_churn_rate ;
