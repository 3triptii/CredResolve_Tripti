# CredResolve – Collections Analytics

## Project Overview
This project analyzes collections performance and independently validates the business claim that **“Recovery has improved by 11% month-on-month.”**

The analysis focuses on recovery performance, data quality, payment attribution, portfolio effects, targeting strategy, and an investment recommendation for the next **₹10 Cr**.

## Key Finding
The reported **11.03% month-on-month increase in absolute recovered amount from February to March 2026 is mathematically correct**.

However, the eligible population increased by **42.41%**, while recovery per eligible account **declined by 22.03%**.

Further decomposition shows:
- Recovered accounts: **+11.32%**
- Average recovery per recovered account: **-0.26%**
- Absolute recovered amount: **+11.03%**

**Conclusion:** the 11% headline is valid in absolute terms, but is primarily volume-driven rather than an improvement in recovery efficiency.

## Major Data Quality Findings
- **500 duplicate payment rows** were identified; duplicate SUCCESS amount was **₹0**.
- **2,741** PTP-payment matches were identified for diagnostic attribution, of which **189 (6.90%)** were valid under the defined rules.
- **1,000/1,000 agent IDs** were mapped to multiple vendors.
- **88,241 calls** were handled by multi-vendor agents.
- The Golden Dataset contains **30,000 unique accounts**, with **0 duplicate account IDs** and **0 missing values**.

## Investment Recommendation
### Recommended Area: Call-channel Optimization

The current call answer rate is **19.87%** and account contact rate is **47.65%**.

A conservative scenario considers improving the answer rate to **25%**, representing a **25.84% relative lift in answered calls**.

The ₹10 Cr investment should be deployed through a **controlled pilot** rather than treated as a guaranteed recovery forecast. The available observational data does not establish a reliable causal estimate of incremental recovery.

## Deliverables
- `credresolvetripti.ipynb` — analysis notebook
- `collections_analysis.sql` — analytical SQL
- `golden_dataset.xlsx` — account-level Golden Dataset
- `dashboard.pdf` — one-screen executive dashboard
- `data_quality_report.pdf` — data quality findings and business impact
- `Executive_Memo_Collections_Performance.pdf` — executive summary and recommendation
- `architecture_diagram.pdf` — production analytics architecture

## Methodology
The work follows a governed analytical flow:

**Raw → Staging → Clean → Golden → Feature → Metrics → Dashboard**

Key controls include deduplication, identity checks, timestamp handling, payment attribution, denominator-aware recovery metrics, and explicit classification of findings as facts or strong evidence.

## Important Caveat
Agent/vendor identity and PTP attribution issues reduce confidence in causal attribution to individual agents, vendors, campaigns, and channels. A controlled experiment is recommended before scaling major investment decisions.
