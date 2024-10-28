WITH hotels AS
(
    SELECT * FROM dbo.['2018$']
    UNION
    (SELECT * FROM dbo.['2019$'])
    UNION
    (SELECT * FROM dbo.['2020$'])
)
SELECT
    arrival_date_year Running_Year,
    hotel,
    ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr),2) Revenue
FROM hotels
GROUP BY arrival_date_year, hotel
ORDER BY 3 DESC;