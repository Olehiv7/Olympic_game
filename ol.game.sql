SELECT 
    a.name,
    c.country_name,
    SUM(r.score) total_score
FROM athletes a
JOIN results r ON a.id = r.athlete_id
JOIN countries c ON a.country_id = c.id
GROUP BY a.id;
