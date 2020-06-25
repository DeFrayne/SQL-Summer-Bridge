# 1. [Warm-up Exercise] Write a SELECT statement that shows for all of the flights during the period February 14th to
# February 17th for each of the four planes above: ‘N125UW’,’N848MQ’,’N328AA’,’N247JB’. Your select statement
# should return the following information: tailnum, flight date information, departure delay, arrival delay, 3 digit
# destination code
SELECT tailnum, month, day, year, dep_delay, arr_delay, dest
FROM flights
WHERE tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB')
AND month = 2
AND day BETWEEN 14 AND 17
ORDER BY tailnum;

# 2. Add a join clause, to also show destination airport name. How many rows were returned?
# Answer: 13 rows.
SELECT tailnum, month, day, year, dep_delay, arr_delay, dest, name
FROM flights
JOIN airports ON flights.dest=airports.faa
WHERE flights.tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB')
AND month = 2
AND day BETWEEN 14 AND 17
ORDER BY tailnum;

# 3. Rewrite the join as a left join, and compare your results.
# There is now a 14th row - a second entry of N247JB with NULL name. This was in #1, too, but the NULL was absent.
# The query in #2 did not include the NULL result because there is no dest='SJU' in the airports table.
# In a JOIN, a lack of agreement between sheets will leave the result out. In a LEFT JOIN, the FROM table will
# prevail over a missing correlating value in the JOINed table.
SELECT tailnum, month, day, year, dep_delay, arr_delay, dest, name
FROM flights
LEFT JOIN airports ON flights.dest=airports.faa
WHERE flights.tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB')
AND month = 2
AND day BETWEEN 14 AND 17
ORDER BY tailnum;

# 4. Add a second left join clause to also show the number of seats in the planes.
SELECT flights.tailnum, month, day, flights.year, dep_delay, arr_delay, dest, name, seats
FROM flights
LEFT JOIN airports ON flights.dest=airports.faa
LEFT JOIN planes ON flights.tailnum=planes.tailnum
WHERE flights.tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB')
AND month = 2
AND day BETWEEN 14 AND 17
ORDER BY tailnum;

# 5. Rewrite your query, using table aliases. (Results unchanged from above). Do you find the code more readable
# with or without table aliases?
# Answer: I find the code more readable without aliases, but I am sure I will adapt.
SELECT f.tailnum, month, day, f.year, dep_delay, arr_delay, dest, name, seats
FROM flights f
LEFT JOIN airports a ON f.dest=a.faa
LEFT JOIN planes p ON f.tailnum=p.tailnum
WHERE f.tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB')
AND month = 2
AND day BETWEEN 14 AND 17
ORDER BY f.tailnum;

# 6. What are the names of the five airports that receive the most flights?
SELECT COUNT(*), a.name
FROM flights f
JOIN airports a ON a.faa = f.dest
GROUP BY f.dest DESC
ORDER BY COUNT(*) DESC
LIMIT 5;

# 7. What are American Airlines’ destination cities from the New York airports?
SELECT a.name, f.origin
FROM flights f
JOIN airports a ON f.dest=a.faa
WHERE origin IN ('JFK', 'EWR', 'LGA')
AND f.carrier = 'AA'
GROUP BY a.name;