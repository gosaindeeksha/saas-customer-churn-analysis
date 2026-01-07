--Inserting data into the final tables and basic data cleaning

--1.Query to insert data into the accounts table
INSERT INTO accounts (
    account_id,
    name,
    industry,
    country,
    signup_date,
    referral_source,
    plan_tier,
    seats,
    is_trial,
    churn_flag
)
SELECT
    account_id,
    account_name,
    industry,
    country,
    signup_date,
    referral_source,
    plan_tier,
    seats,
    is_trial,
    churn_flag
FROM accounts_staging
WHERE account_id != 'account_id';

-- Some Queries to check if data has been imported properly 
SELECT COUNT(*) FROM accounts;
SELECT * FROM accounts LIMIT 5;

--2.Query to insert data into the subscriptions table
INSERT INTO subscriptions (
    subscription_id,
    account_id,
    start_date,
    end_date,
    plan_tier,
    seats,
    monthly_revenue,
    annual_revenue,
    is_trial,
    upgrade_flag,
    downgrade_flag,
    churn_flag,
    billing_frequency,
    auto_renew_flag
)
SELECT
    subscription_id,
    account_id,
    start_date,
    end_date,
    plan_tier,
    seats,
    mrr_amount,
    arr_amount,
    is_trial,
    upgrade_flag,
    downgrade_flag,
    churn_flag,
    billing_frequency,
    auto_renew_flag
FROM subscriptions_staging
WHERE subscription_id != 'subscription_id';

-- Some Queries to check if data has been imported properly 
SELECT COUNT(*) FROM subscriptions;
SELECT * FROM subscriptions LIMIT 5;

--3.Query to insert data into the feature usage table
INSERT INTO feature_usage (
    usage_id,
    subscription_id,
    usage_date,
    feature_name,
    usage_count,
    usage_duration_secs,
    error_count,
    is_beta_feature
)
SELECT
    usage_id,
    subscription_id,
    usage_date,
    feature_name,
    usage_count,
    usage_duration_secs,
    error_count,
    is_beta_feature
FROM feature_usage_staging
WHERE usage_id != 'usage_id' AND  rowid IN (SELECT MIN(rowid) FROM feature_usage_staging GROUP BY usage_id);--rowid is implicit column in sqlite
--feature usage had 21 duplicates in usage_id column; since the rows were completely different and source documentation clearly mentioned usage_id as unique

-- Some Queries to check if data has been imported properly 
SELECT COUNT(*) FROM feature_usage;
SELECT * FROM feature_usage LIMIT 5;

--4.Query to insert data into the support ticket table
INSERT INTO support_ticket (
    ticket_id,
    account_id,
    submitted_at,
    closed_at,
    resolution_time_hours,
    priority,
    first_response_time_minutes,
    satisfaction_score,
    escalation_flag
)
SELECT
    ticket_id,
    account_id,
    submitted_at,
    closed_at,
    resolution_time_hours,
    priority,
    first_response_time_minutes,
    satisfaction_score,
    escalation_flag
FROM support_tickets_staging
WHERE ticket_id != 'ticket_id';

-- Some Queries to check if data has been imported properly 
SELECT COUNT(*) FROM support_ticket;
SELECT * FROM support_ticket LIMIT 5;

--5.Query to insert data into the churn table
INSERT INTO churn (
    churn_event_id,
    account_id,
    churn_date,
    reason_code,
    refund_amount_usd,
    preceding_upgrade_flag,
    preceding_downgrade_flag,
    is_reactivation,
    feedback_text
)
SELECT
    churn_event_id,
    account_id,
    churn_date,
    reason_code,
    refund_amount_usd,
    preceding_upgrade_flag,
    preceding_downgrade_flag,
    is_reactivation,
    feedback_text
FROM churn_staging
WHERE churn_event_id != 'churn_event_id';

-- Some Queries to check if data has been imported properly 
SELECT COUNT(*) FROM churn;
SELECT * FROM churn LIMIT 5;