--SQL queries to CREATE staging table to transfer raw data in our data model

--1.  Query to create staging table for accounts data
 CREATE TABLE IF NOT EXISTS accounts_staging(
    account_id TEXT,
    account_name TEXT,
    industry TEXT,
    country CHAR(2),
    signup_date TEXT ,
    referral_source TEXT,
    plan_tier TEXT,
    seats INTEGER,
    is_trial BOOLEAN,
    churn_flag BOOLEAN
 );
 -- Some Queries to check if data has been imported properly from the CSV file
SELECT COUNT(*) FROM accounts_staging;
SELECT * FROM accounts_staging LIMIT 5;

--2.  Query to create staging table for subscriptions data
CREATE TABLE IF NOT EXISTS subscriptions_staging(
    subscription_id TEXT ,
    account_id TEXT,
    start_date  TEXT,
    end_date TEXT,
    plan_tier TEXT,
    seats INTEGER, 
    mrr_amount REAL, 
    arr_amount REAL, 
    is_trial BOOLEAN,
    upgrade_flag BOOLEAN,
    downgrade_flag BOOLEAN, 
    churn_flag BOOLEAN,
    billing_frequency TEXT,
    auto_renew_flag BOOLEAN 
);
 -- Some Queries to check if data has been imported properly from the CSV file
SELECT COUNT(*) FROM subscriptions_staging;
SELECT * FROM subscriptions_staging LIMIT 5;

--3.  Query to create staging table for feature usage data
CREATE TABLE IF NOT EXISTS feature_usage_staging(
    usage_id TEXT, 
    subscription_id TEXT,
    usage_date TEXT,
    feature_name TEXT,
    usage_count INTEGER,
    usage_duration_secs INTEGER, 
    error_count INTEGER,
    is_beta_feature BOOLEAN
);
 -- Some Queries to check if data has been imported properly from the CSV file
SELECT COUNT(*) FROM feature_usage_staging;
SELECT * FROM feature_usage_staging LIMIT 5;

--4.  Query to create staging table for support tickets data
CREATE TABLE IF NOT EXISTS support_tickets_staging(
    ticket_id TEXT,
    account_id TEXT,
    submitted_at TEXT,
    closed_at TEXT,
    resolution_time_hours REAL,
    priority  TEXT,
    first_response_time_minutes INTEGER,
    satisfaction_score INTEGER,
    escalation_flag BOOLEAN

);
 -- Some Queries to check if data has been imported properly from the CSV file
SELECT COUNT(*) FROM support_tickets_staging;
SELECT * FROM support_tickets_staging LIMIT 5;

--5.  Query to create staging table for churn events data
CREATE TABLE IF NOT EXISTS churn_staging(
    churn_event_id TEXT,
    account_id TEXT,
    churn_date TEXT,
    reason_code TEXT,
    refund_amount_usd REAL,
    preceding_upgrade_flag BOOLEAN,
    preceding_downgrade_flag BOOLEAN,
    is_reactivation BOOLEAN,
    feedback_text TEXT
);
 -- Some Queries to check if data has been imported properly from the CSV file
SELECT COUNT(*) FROM churn_staging;
SELECT * FROM churn_staging LIMIT 5;