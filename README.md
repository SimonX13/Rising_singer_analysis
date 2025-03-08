# Audiomack Data Analysis Project

## Overview

This project involves a detailed analysis of music streaming data from **Audiomack** to uncover trends and key factors influencing song popularity. The dataset spans **24** months with **710,000 entries** and includes various engagement metrics such as downloads, likes, and playlist additions.

## Key Findings

### Actionable Insights

- **Monthly Downloads & Favorites** are the most important key indicators of high play counts.
- **Cumulative Add-to-Playlist** is the strongest indicator of a sudden increase in plays.
- **Regional Analysis:** The majority of plays for the top 10 hit songs occurred in **Sub-Saharan Africa**, reflecting Audiomack’s focus on Afrobeats and Latin music.

### Top 10 Hidden Gem Songs (Potential Future Hits in Sub-Saharan Africa)

1. *Goodsin* - Olivetheboy
2. *Butta My Bread* - JZyNo
3. *Daddy Wey Dey Pamper* - Moses Bliss
4. *Call of Duty* - Zinoleesky
5. *Aseda* - Nacee
6. *Too Faithful* - Moses Bliss
7. *Personal* - Zinoleesky
8. *Many Things* - Zinoleesky
9. *Hope* - XXXTentacion
10. *F.N* - Lil TJay

## Justification & Methodology

- **Data Processing:**
  - Extracted ratios and cumulative engagement metrics to capture early trends.
  - Analyzed regional differences by mapping countries to broader classifications.
- **Machine Learning Approach:**
  - Implemented an **XGBoost Regressor** to identify key features influencing play counts.
  - Used **SHAP values** to interpret feature importance.
- **Interesting Observation:**
  - Some songs had a *higher download-to-play ratio*, suggesting bulk album downloads where only select songs were frequently played.

## Recommendations for Improved Data Analysis

1. **Retention Rate Data**: Introduce a *first 30-second retention rate* metric (similar to YouTube).
2. **External Data Integration**: Collaborate with **Shazam** to track sudden song recognitions.
3. **Granular Time Analysis**: Collect **daily data** instead of monthly to analyze trends in the first 72 hours of a song’s release.
4. **News & Context Integration**:
   - Example: The **Kendrick Lamar vs. Drake beef** significantly boosted streams of *Not Like Us* before it won a Grammy.
   - Incorporating **news sentiment analysis** could enhance early hit predictions.

## Technologies Used

- **Python (Pandas, NumPy, Matplotlib, Seaborn)** for data analysis and visualization.
- **XGBoost Regressor** for machine learning predictions.
- **Jupyter Notebook** for exploratory data analysis.
- **SQL & Sequelize** for structured data storage.

## How to Use

1. **Run the Jupyter Notebook** (`audiomack.ipynb`) to see the data analysis in action.
2. **Check the Report** (`Report.pdf`) for a detailed breakdown of findings.
3. **Explore the Dataset** (if provided) to run additional queries or tests.

## Acknowledgment

This analysis was conducted by **Simon Xia** (*[sx2393@columbia.edu](mailto:sx2393@columbia.edu)*). Data sources include Audiomack streaming metrics and external insights into emerging trends in digital music consumption.

## Images
![image](https://github.com/user-attachments/assets/5ad5134c-c306-4f7c-8c3c-eabc4e8fe760)
![image](https://github.com/user-attachments/assets/6e80ccfc-8a46-4bbf-bcd8-cb2a8779b0bb)

![image](https://github.com/user-attachments/assets/3efa8c41-c255-4b7a-a04d-a7bf096a5fdb)
![image](https://github.com/user-attachments/assets/04f7de53-391b-42e7-9518-79db6506ad5c)

