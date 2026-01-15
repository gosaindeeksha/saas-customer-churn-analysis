--SQL Queries to CREATE final tables


--1.  Query to create table for accounts data
 CREATE TABLE IF NOT EXISTS accounts(
    account_id TEXT PRIMARY KEY,
    name TEXT,
    industry TEXT,
    country CHAR(2),
    signup_date TEXT ,
    referral_source TEXT,
    plan_tier TEXT,
    seats INTEGER,
    is_trial BOOLEAN,
    churn_flag BOOLEAN
 );

--2.  Query to create table for subscriptions data
CREATE TABLE IF NOT EXISTS subscriptions(
    subscription_id TEXT PRIMARY KEY,
    account_id TEXT NOT NULL,
    start_date  TEXT,
    end_date TEXT,
    plan_tier TEXT,
    seats INTEGER, 
    monthly_revenue REAL, 
    annual_revenue REAL, 
    is_trial BOOLEAN,
    upgrade_flag BOOLEAN,
    downgrade_flag BOOLEAN, 
    churn_flag BOOLEAN,
    billing_frequency TEXT,
    auto_renew_flag BOOLEAN,

    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

--3.  Query to create table for feature usage data
CREATE TABLE IF NOT EXISTS feature_usage(
    usage_id TEXT PRIMARY KEY, 
    subscription_id TEXT,
    usage_date TEXT,
    feature_name TEXT,
    usage_count INTEGER,
    usage_duration_secs INTEGER, 
    error_count INTEGER,
    is_beta_feature BOOLEAN,

    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

--4.  Query to create table for churn events data
CREATE TABLE IF NOT EXISTS churn(
    churn_event_id TEXT PRIMARY KEY,
    account_id TEXT,
    churn_date TEXT,
    reason_code TEXT,
    refund_amount_usd REAL,
    preceding_upgrade_flag BOOLEAN,
    preceding_downgrade_flag BOOLEAN,
    is_reactivation BOOLEAN,
    feedback_text TEXT,

    FOREIGN KEY (account_id) REFERENCES accounts(account_id)

);