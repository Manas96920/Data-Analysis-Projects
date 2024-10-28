WITH hotels AS
(
    SELECT * FROM dbo.['2018$']
    UNION
    (SELECT * FROM dbo.['2019$'])
    UNION
    (SELECT * FROM dbo.['2020$'])
)
SELECT
    hotels.hotel,
    hotels.meal,
    ROUND(SUM(mc.Cost),2) Total_Meal_Revenue
FROM hotels
LEFT JOIN meal_cost$ mc ON mc.meal = hotels.meal
GROUP BY
    hotels.hotel,
    hotels.meal
ORDER BY 3 DESC