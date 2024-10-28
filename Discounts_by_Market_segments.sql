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
    hotels.market_segment,
    ROUND(SUM(ms.discount),2) Total_Discount
FROM hotels
LEFT JOIN market_segment$ ms ON ms.market_segment = hotels.market_segment
GROUP BY
    hotels.hotel,
    hotels.market_segment
ORDER BY 3 DESC