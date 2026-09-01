-- Collections Recovery Analysis
-- Reproducible analytical SQL

-- 1. Remove duplicate payment records
CREATE OR REPLACE TABLE clean_payments AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY payment_id
               ORDER BY event_at
           ) AS rn
    FROM payments
)
WHERE rn = 1;

-- 2. Successful payments
CREATE OR REPLACE TABLE success_payments AS
SELECT *
FROM clean_payments
WHERE payment_status = 'SUCCESS';

-- 3. Account-level recovery
CREATE OR REPLACE TABLE account_recovery AS
SELECT
    a.account_id,
    a.principal_amount,
    a.outstanding_amount,
    a.dpd,
    a.risk_segment,
    a.status,
    a.loan_type,
    a.opened_at,
    a.timezone,
    COALESCE(SUM(sp.amount), 0) AS success_payment_amount,
    COUNT(sp.payment_id) AS success_payment_count,
    COALESCE(SUM(sp.amount), 0) / NULLIF(a.outstanding_amount, 0)
        AS recovery_rate
FROM accounts a
LEFT JOIN success_payments sp
    ON a.account_id = sp.account_id
GROUP BY
    a.account_id,
    a.principal_amount,
    a.outstanding_amount,
    a.dpd,
    a.risk_segment,
    a.status,
    a.loan_type,
    a.opened_at,
    a.timezone;

-- 4. Recovery by risk segment
SELECT
    risk_segment,
    COUNT(DISTINCT account_id) AS eligible_accounts,
    COUNT(DISTINCT CASE
        WHEN success_payment_amount > 0 THEN account_id
    END) AS recovered_accounts,
    SUM(success_payment_amount) AS recovered_amount,
    SUM(success_payment_amount)
        / NULLIF(SUM(outstanding_amount), 0)
        AS amount_recovery_rate
FROM account_recovery
GROUP BY risk_segment;

-- 5. Recovery by loan type
SELECT
    loan_type,
    COUNT(DISTINCT account_id) AS accounts,
    COUNT(DISTINCT CASE
        WHEN success_payment_amount > 0 THEN account_id
    END) AS recovered_accounts,
    SUM(success_payment_amount) AS recovered_amount,
    SUM(success_payment_amount)
        / NULLIF(SUM(outstanding_amount), 0)
        AS amount_recovery_rate
FROM account_recovery
GROUP BY loan_type;

-- 6. Overall recovery
SELECT
    COUNT(DISTINCT account_id) AS accounts,
    COUNT(DISTINCT CASE
        WHEN success_payment_amount > 0 THEN account_id
    END) AS recovered_accounts,
    SUM(success_payment_amount) AS recovered_amount,
    SUM(success_payment_amount)
        / NULLIF(SUM(outstanding_amount), 0)
        AS amount_recovery_rate
FROM account_recovery;
