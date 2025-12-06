# Project Title: "Motor Carrier Risk Segmentation"

## Description

This report presents a data-mining workflow applied to FMCSA crash, exposure, and vehicle datasets for the purpose of generating risk-based insights at the carrier level.

The main goals are to:

- [Goal 1 –  build a carrier-year modeling table]
- [Goal 2 –  apply classification and clustering methods]
- [Goal 3 –  interpret results for risk selection / underwriting]

## Research Questions and Answers (Summary)

**Q1. How do crash rates vary by carrier size and vehicle composition?**  


**Answer:**  
Big fleets are safer per mile Variance stabilizes with exposure
Crash uncertainty collapses as fleets grow.


**Q2. Can we segment carriers into risk tiers using k-means clustering?**  


**Answer:**  

K-means segmentation successfully distinguishes operational risk environments 
among carriers. The highest-risk segment consists of small light fleets with 
poor compliance outcomes. The lowest-risk segment consists of large heavy 
carriers with mature operations and more stable safety performance. A mid-tier 
segment captures blended fleets with moderate characteristics. Regulatory inspection 
behavior, fleet composition, and equipment maturity are the most discriminative
features, supporting their use as early safety indicators in commercial auto 
underwriting and performance monitoring.

**Q3. Which variables are most important in classifying carriers with high injury or fatal crash rates?**  

**Answer:**  

vg_rep_gwr_top = 32,714 lbs, heavy commercial fleet  
pct_rep_gwr_gt33k = 0.9284, 93% heavy trucks  
pct_fuel_diesel = 0.9778, diesel dominant (true trucking fleet)  
pct_age_0_4 = 0.5581,very new equipment  
violations_per_insp = 1.3243, moderate compliance issues  
insp_oos_rate = 0.2367, moderate OOS 



## Repository Structure

```
final_project/
├── docs/
├── notebooks/
├── src/
└── README.md
```

## Links

[Final Project Paper(PDF)(docs/Final_Report.pdf)]

