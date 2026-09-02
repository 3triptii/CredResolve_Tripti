# 📊 CredResolve – Collections Analytics

> **Independent verification of collections performance, data quality, and capital allocation strategy.**

---

## 📌 Project Overview

This project analyzes **CredResolve's collections performance** and independently validates the business claim:

> **“Recovery has improved by 11% month-on-month.”**

The analysis evaluates:

* Recovery performance and efficiency
* Data quality and governance
* Payment attribution and PTP matching
* Portfolio and denominator effects
* Collection channel performance
* Targeting strategy
* Investment allocation for the next **₹10 Cr**

---

## 🎯 Key Finding

The reported **11.03% month-on-month increase in absolute recovered amount from February to March 2026 is mathematically correct.**

However, the eligible population increased by **42.41%**, while recovery per eligible account **declined by 22.03%**.

### Performance Decomposition

| Metric                                 | Feb → Mar 2026 | Interpretation                              |
| -------------------------------------- | -------------: | ------------------------------------------- |
| 💰 Absolute Recovered Amount           |    **+11.03%** | Headline increase is mathematically correct |
| 👥 Eligible Population                 |    **+42.41%** | Significant expansion of the portfolio base |
| 🎯 Recovery per Eligible Account       |    **-22.03%** | Underlying recovery efficiency declined     |
| ✅ Recovered Accounts                   |    **+11.32%** | Growth largely driven by account volume     |
| 💵 Avg. Recovery per Recovered Account |     **-0.26%** | Per-case recovery remained broadly stable   |

### 🔎 Conclusion

The **11% headline is valid in absolute terms**, but the analysis indicates that the increase is **primarily volume-driven rather than an improvement in recovery efficiency**.

---

## 🛡️ Major Data Quality Findings

A detailed data quality and governance audit was performed before deriving business metrics.

| Finding                              |            Result | Business Impact                              |
| ------------------------------------ | ----------------: | -------------------------------------------- |
| Duplicate payment rows               |           **500** | Required deduplication before analysis       |
| Duplicate SUCCESS amount             |            **₹0** | No direct impact on recovered amount         |
| PTP-payment matches                  |         **2,741** | Diagnostic attribution population            |
| Valid PTP matches                    |   **189 (6.90%)** | Limited confidence in direct PTP attribution |
| Agent IDs mapped to multiple vendors | **1,000 / 1,000** | Vendor-level attribution risk                |
| Calls handled by multi-vendor agents |        **88,241** | Limits agent/vendor performance attribution  |
| Golden Dataset unique accounts       |        **30,000** | Account-level analytical base                |
| Duplicate account IDs                |             **0** | No duplicate accounts in Golden Dataset      |
| Missing values                       |             **0** | Complete Golden Dataset                      |

### Data Governance Controls

The analytical pipeline incorporates:

* Payment deduplication
* Account identity validation
* Timestamp handling
* Payment attribution checks
* Agent/vendor identity validation
* Denominator-aware recovery metrics
* Separation of factual findings from strong evidence

---

## 💰 Investment Recommendation

### Recommended Area: Call-Channel Optimization

The analysis identifies **call-channel optimization** as the recommended area for the next **₹10 Cr investment**.

Current performance:

* **Call Answer Rate:** 19.87%
* **Account Contact Rate:** 47.65%

### Conservative Scenario

A scenario was evaluated in which the call answer rate improves from **19.87% to 25%**.

This represents a **25.84% relative lift in answered calls**.

However, the analysis does **not** treat this scenario as a guaranteed recovery forecast.

### Recommended Approach

> **Deploy the ₹10 Cr through a controlled pilot rather than scaling the investment immediately.**

The available observational data does not establish a sufficiently reliable causal estimate of incremental recovery.

A controlled experiment should therefore be used to measure:

1. Incremental contactability
2. Incremental payment conversion
3. Incremental recovered amount
4. Cost per incremental recovery
5. ROI versus alternative collection channels

---

## 🔄 Analytical Methodology

The project follows a governed analytical pipeline:

```text
Raw Data
   ↓
Staging
   ↓
Clean
   ↓
Golden Dataset
   ↓
Feature Engineering
   ↓
Metrics
   ↓
Dashboard
```

### Analytical Focus

**Data → Quality → Attribution → Performance → Strategy → Investment**

The analysis combines data validation, SQL analytics, Python-based exploration, account-level feature engineering, and business interpretation.

---

## 📂 Deliverables

| File                                         | Description                                     |
| -------------------------------------------- | ----------------------------------------------- |
| `credresolvetripti.ipynb`                    | Complete Python analysis notebook               |
| `collections_analysis.sql`                   | Analytical SQL queries                          |
| `golden_dataset.xlsx`                        | Account-level Golden Dataset                    |
| `dashboard.pdf`                              | One-screen executive dashboard                  |
| `data_quality_report.pdf`                    | Data quality findings and business impact       |
| `Executive_Memo_Collections_Performance.pdf` | Executive summary and investment recommendation |
| `architecture_diagram.pdf`                   | Production analytics architecture               |

---

## ⚠️ Important Caveat

Agent/vendor identity issues and limited PTP-payment attribution reduce confidence in causal attribution to **individual agents, vendors, campaigns, and channels**.

Therefore:

> **Observed performance differences should not automatically be interpreted as causal effects.**

A controlled experiment is recommended before making large-scale investment decisions based on channel or agent-level performance.

---

## 🏁 Final Takeaway

The analysis challenges the interpretation of the reported **11% recovery improvement**.

While **absolute recovered amount increased by 11.03%**, the eligible portfolio expanded by **42.41%**, resulting in a **22.03% decline in recovery per eligible account**.

**The key business insight is therefore not simply that recovery increased, but that the increase was achieved primarily through greater portfolio volume rather than improved recovery efficiency.**

This distinction is critical when evaluating collection strategy and deciding where to deploy the next **₹10 Cr**.
