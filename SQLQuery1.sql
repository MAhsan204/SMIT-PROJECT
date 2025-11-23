SELECT
    Category,
    AVG(Price) AS AvgPrice
FROM project_smit
GROUP BY Category
ORDER BY Category;


SELECT
    Category,
    AVG(Rating) AS AvgRating
FROM project_smit
GROUP BY Category
ORDER BY Category;


SELECT
    Category,
    COUNT(*) AS ProductCount
FROM project_smit
GROUP BY Category
ORDER BY ProductCount DESC;



WITH RankedProducts AS (
    SELECT
        Category,
        Title,
        Review,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Review DESC) AS rn
    FROM project_smit
)
SELECT
    Category,
    Title,
    Review
FROM RankedProducts
WHERE rn <= 5
ORDER BY Category, Review DESC;
