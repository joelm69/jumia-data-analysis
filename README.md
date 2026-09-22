# Jumia Product Analysis

## Project Overview
This project analyses e-commerce product data from Jumia to investigate
the relationship between discounts, customer engagement, product ratings
and prices.

The project follows a data analysis workflow using Python for data
inspection and cleaning PostgreSQL for structured analysis, and
Microsoft Excel for visualization and dashboard development.

The goal is to transform raw e-commerce product data into practical
business insights that can help Jumia sellers make better pricing and
positioning decisions.

## Analysis Process

The analysis was completed in several stages:

1. **Data inspection and cleaning with Python**
   - Loaded and inspected the raw dataset.
   - Checked data types, missing values and invalid values.
   - Investigated the meaning of the review field using the data dictionary.
   - Removed invalid records.
   - Created the cleaned dataset for further analysis.

2. **Data storage and analysis with PostgreSQL**
   - Loaded the cleaned dataset into PostgreSQL.
   - Used SQL queries to explore product prices, discounts, ratings and reviews.
   - Used aggregations and analytical queries to answer the business questions.

3. **Excel analysis and dashboard development**
   - Imported the cleaned data into Excel.
   - Created calculated fields and supporting formulas.
   - Built pivot tables to summarise the analysis.
   - Created charts to communicate the findings.
   - Developed an interactive dashboard presenting the key metrics and insights.

   ## Data Cleaning

The original dataset contained 115 product records.

Python was used to inspect the dataset and identify data quality issues.
The review field was investigated using the accompanying data dictionary,
which showed that review values were exported as negative numbers and
were blank when no reviews were available.
Three records containing invalid negative review-source values were
removed during cleaning.
Missing ratings were retained because they represent unavailable data
rather than values that should be artificially assigned.
After cleaning, the final dataset contained 112 product records.

## Key Findings

The analysis produced several key findings:

- The correlation between discount and review values was **-0.1368**.
- The correlation between price and rating was **0.1101**.
- **55 products** had missing ratings.
- **62 products** were classified as having high discounts.
- **32 products** were classified as having medium discounts.
- **18 products** were classified as having low discounts.

## Business Findings

### 1. Are higher discounts leading to higher customer engagement?

The analysis examined the relationship between product discounts and
customer review activity.

The correlation between discount and review values was **-0.1368**.

The review field in the original dataset is stored as a negative value,
so the direction of this correlation needs to be interpreted according
to the dataset's data definition.

The relationship is weak, indicating that discount level alone does not
provide strong evidence that higher discounts lead to greater customer
engagement.

This suggests that sellers should not rely on increasing discounts as
the only method of generating customer engagement.

### 2. Do highly rated products have higher or lower prices?

The analysis examined the relationship between product price and rating.

The correlation between price and rating was **0.1101**, indicating a
weak positive relationship.

This means that higher-rated products tend to have slightly higher
prices in the dataset, but the relationship is weak. Therefore, the
analysis does not provide strong evidence that higher prices are
associated with higher product ratings.

Other factors are likely to contribute to product ratings and customer
engagement.

### 3. Which products are performing best, and which need a better pricing strategy?

Product performance was evaluated using customer ratings and review activity, while pricing-review candidates were identified using discount, rating and price indicators.

#### Stronger-performing products

Several products had strong ratings combined with meaningful customer engagement.

Examples include:

- **137 Pieces Cake Decorating Tool Set** — 4.6 rating and 55 reviews.
- **Electronic Digital Display Vernier Caliper** — 4.6 rating and 49 reviews.
- **3D Waterproof EVA Plastic Shower Curtain** — 4.6 rating and 44 reviews.
- **100 Pcs Crochet Hook Tool Set** — 4.7 rating and 39 reviews.

These products show a combination of relatively strong customer ratings and higher review activity within the dataset.

The analysis also identified products with perfect 5.0 ratings, including the **LASA Aluminum Folding Truck Hand Cart**, although these products generally had fewer reviews. This demonstrates why both rating and review activity were considered rather than using rating alone.

#### Products requiring pricing review

Products were flagged for pricing review when they combined a relatively high discount with either a relatively low rating or a relatively high current price.

The thresholds were determined from the dataset:

- High discount: **49% or higher**
- Low rating: **3.0 or lower**
- High current midpoint price: **1,669.5 or higher**

Five products met these criteria.

The **5-PCS Stainless Steel Cooking Pot Set** had a 55.0% discount, a 2.1 rating, 13 reviews and a current midpoint price of 2,115. This combination suggests that the seller could review the product's pricing and positioning.

The **Intelligent LED Body Sensor Wireless Lighting** product had a 52.2% discount, a 2.7 rating and 15 reviews, providing another example of high discounting combined with weaker customer ratings.

The **Mythco 120COB Solar Wall Light** had a 53.5% discount and a 3.0 rating, while the **380ML USB Rechargeable Portable Small Blender** had a 50.0% discount and a 2.3 rating.

The **LASA 3 Tier Bamboo Shoe Bench Storage Shelf** was different: it had a strong 4.3 rating but also a 54.5% discount and a relatively high current midpoint price of 2,048. It was therefore identified as a pricing-review candidate rather than an underperforming product.

These results should be interpreted as indicators for further pricing or product-positioning review rather than proof that a particular price is incorrect.
### 4. Recommendations for Jumia Sellers

Based on the analysis, three recommendations can be made for sellers.

#### 1. Do not rely on discounts alone to drive customer engagement

The correlation between discount and review activity was **-0.1368**, indicating a weak relationship.

This suggests that increasing discounts alone may not reliably increase customer engagement. Sellers should consider product quality, customer experience and product positioning alongside pricing promotions.

#### 2. Monitor customer satisfaction alongside pricing decisions

The analysis identified several highly discounted products with relatively low ratings.

For example, the **5-PCS Stainless Steel Cooking Pot Set** had a **55.0% discount** but a **2.1 rating** and 13 reviews. The **Intelligent LED Body Sensor Wireless Lighting** product had a **52.2% discount**, a **2.7 rating** and 15 reviews.

Sellers should therefore monitor ratings and customer feedback when evaluating whether discounts are improving product performance.

#### 3. Review the pricing of expensive products with high discount levels

Products with relatively high prices and heavy discounts should be reviewed to determine whether the pricing structure is competitive and sustainable.

The **LASA 3 Tier Bamboo Shoe Bench Storage Shelf** had a **54.5% discount** and a current midpoint price of **2,048**, while the **5-PCS Stainless Steel Cooking Pot Set** had a **55.0% discount** and a current midpoint price of **2,115**.

These examples indicate areas where sellers could review their pricing, product positioning and promotional strategy rather than relying solely on large discounts.