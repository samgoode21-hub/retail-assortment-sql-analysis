# Retail Assortment & Customer SQL Analysis

## Overview

This project analyzes a retail e-commerce dataset spanning 180,836 order items and
100,000 customers across 29,120 products, 2,756 brands, and 26 product categories.
Using SQL in Google BigQuery, I explore category profitability, brand performance,
customer segmentation, and assortment efficiency to answer a central business question:

**Where is this retailer's assortment winning, where is it leaking, and who should it merchandise toward?**

All queries were written in BigQuery Standard SQL against the public `thelook_ecommerce`
dataset. This project demonstrates applied SQL skills including multi-table JOINs
(INNER and LEFT), CASE WHEN segmentation, aggregation, per-customer and per-unit
metrics, and IS NULL analysis to identify products that never sold.

## Business Questions

1. Which product categories generate the most profit?
2. Which customer age groups generate the most completed revenue?
3. Which brands generated the most completed revenue, and do they win on volume or price?
4. Which product categories carry the most never-sold inventory?

## Key Findings

- **Outerwear & Coats and Jeans dominate category profit**, at $193K and $148K respectively, leading on both revenue and profit.
- **Revenue rank does not equal profit rank**: Accessories generates $64.8K in profit, outranking four categories that produced more revenue, indicating stronger margins on lower sales volume.
- **Customer age does not meaningfully segment value**: per-customer revenue is flat across ages 20-69, ranging only from $97.89 to $99.71 (under a 2% spread) with near-identical customer counts. Only the tails differ, with Under-20 at $95.75 and 70+ at $92.67 across just 484 customers.
- **The top ten brands, out of 2,756 total, split into two distinct archetypes**: volume brands like Calvin Klein generate $53.4K across 817 units sold at $65.36 per unit, while premium brands like The North Face reach the top ten on only 59 units at $443.64 per unit.
- **Assortment efficiency is high, with negligible dead inventory**: only 63 of roughly 29,000 catalog products have never sold (0.2%), and those are spread evenly across 20 categories with a maximum of 8 in any single one (Intimates), indicating no systemic over-assortment.

## Dataset
**Source:** Google BigQuery Public Data<br>
**Dataset:** `bigquery-public-data.thelook_ecommerce`<br>
**Rows:** 180,836<br>
**Tables Used:** `order_items`, `products`, `users`<br>

**Key Columns:**
- `products.category`, `products.brand`, `products.name` — product dimensions
- `products.cost`, `products.retail_price` — cost and pricing
- `order_items.sale_price`, `order_items.status` — transaction values and order state
- `users.age`, `users.id` — customer dimensions

**Methodology Notes:**
- **Revenue is defined as completed sales only.** Order status includes Complete, Shipped, Processing, Cancelled, and Returned. Cancelled and Returned orders represent roughly 25% of gross transaction value and were excluded from all revenue and profit calculations, since that money was never realized.
- **This dataset does not model promotional discounting.** Verification confirmed that `sale_price` equals `retail_price` equals retail_price across all records, meaning discount depth and promotional lift cannot be measured here. Analysis therefore focuses on category and brand profitability rather than promotional effectiveness.

## Tools Used

- **SQL (BigQuery Standard SQL)** — primary analysis language
- **Google BigQuery** — query execution and data exploration
- **GitHub** — project documentation and version control

## Project Structure

```
retail-assortment-sql-analysis/
├── README.md
├── queries/
│   ├── 01_profit_by_category.sql
│   ├── 02_revenue_by_age_segment.sql
│   ├── 03_top_brands_by_revenue.sql
│   └── 04_dead_inventory_by_category.sql
├── findings/
│   └── summary.md
└── images/
    └── (4 query result screenshots)
```
