/* AVG current_price,old_price,discount_rating */
SELECT
    ROUND(AVG(current_price_mid)::numeric, 2) AS current_price,
    ROUND(AVG(old_price_mid)::numeric, 2) AS old_price,
    ROUND(AVG(discount)::numeric, 2) AS discount,
    ROUND(AVG(rating)::numeric, 2) AS average_rating
FROM products;

/* How many product review in clean data */
SELECT 
    COUNT(DISTINCT product) AS product_count,
    COUNT(DISTINCT review) AS review_count
FROM products;

/* Products most and least expensive */ 
(SELECT 
    product, 
    current_price_mid, 
    rating,
    'Most_expensive' as ranking_group
 FROM products
 ORDER BY current_price_mid DESC
 LIMIT 1)
UNION ALL
(SELECT 
    product, 
    current_price_mid, 
    rating,
    'Cheapest' as ranking_group
 FROM products
 ORDER BY current_price_mid ASC
 LIMIT 1);

/* correlation between highly rated products and reviews" */
/*expensive products rated higher than cheaper*/
SELECT CORR(rating, review) as rating_review_relationship,
CORR(rating, current_price_mid) as rating_price_relationship
FROM products;

/* Top 10  and bottom 5 orders by discount */
(
    SELECT
        product,
        discount,
        'Top 10' AS ranking_group
    FROM products
    ORDER BY discount DESC
    LIMIT 10
)
UNION ALL
(
    SELECT
        product,
        discount,
        'Bottom 5' AS ranking_group
    FROM products
    ORDER BY discount ASC
    LIMIT 5
);



/* Top 10  and  bottom 5 orders by number of reviews */
(
    SELECT
        product,
        review,
        'Top 10' AS ranking_group
    FROM products
    where review is not null
    ORDER BY review DESC
    LIMIT 10
)
UNION ALL
(
    SELECT
        product,
        review,
        'Bottom 5' AS ranking_group
    FROM products
    where review is not null
    ORDER BY review ASC
    LIMIT 5
);


/* Top 10  and bottom 5 products rating */
(
    SELECT
        product,
        rating,
        'Top 10' AS ranking_group
    FROM products
    where rating is not null
    ORDER BY rating DESC
    LIMIT 10
)
UNION ALL
(
    SELECT
        product,
        rating,
        'Bottom 5' AS ranking_group
    FROM products
    where rating is not null
    ORDER BY rating ASC
    LIMIT 5
);

/*high discounts but low ratings*/

 SELECT
    product,
    rating,
    discount,
    CASE
        WHEN rating IS NULL THEN 'Not Rated'
        ELSE rating::text
    END AS rating_status
FROM products
WHERE discount IS NOT NULL
ORDER BY discount desc
limit 10;
 
 
/* high dicounts no reviews */

select 
product,
review,
discount,
discount_amount,
 case 
 	when review is null then 'Not Reviewed'
 	else review :: text
 	end as review_status
 	from products
 	where discount_amount is not null
 	order by discount desc
 	limit 10;
 

/* products show strong customer demand */ 
SELECT
    product,
    review,
    rating
FROM products
WHERE review IS NOT NULL
  AND rating IS NOT NULL
ORDER BY review desc
limit 10;

/*Products with many reviews but average ratings*/
WITH highly_reviewed AS (
    SELECT
        product,
        review,
        rating
    FROM products
    WHERE review IS NOT NULL
      AND rating IS NOT NULL
    ORDER BY review DESC
    LIMIT 10
)
SELECT
    product,
    review,
    rating
FROM highly_reviewed
WHERE rating BETWEEN 3 AND 4.5
ORDER BY review DESC;
