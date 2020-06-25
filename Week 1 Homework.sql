#1 JFK to NHL is the greatest distance.
SELECT distance, origin, dest
FROM flights
ORDER BY distance DESC
LIMIT 1;

#2 There are 2 4 Cycle engines, 28 Reciprocating engines, 2750 Turbo-fan engines, 535 Turbo-jet engines
#2 Turbo-prop engines, and 5 Turbo-shaft engines.
SELECT COUNT(engine),engine
FROM planes
GROUP BY engine;

#2 For the second question: 1 engine seat max is 16, on the model 150.
#  2 engine seat max is 400; model is EMB-145XR.
#  3 engine seat max is 379; model is A330-223.
#  4 engine seat max is 450; model is A340-313.
SELECT model, engine, engines, MAX(seats)
FROM planes
GROUP BY engines;

#3 There are 336,776 flights.
SELECT COUNT(*)
FROM flights;

#4 Carrier 9E: 18460; AA: 32729; AS: 714; B6: 54635; DL: 48110; EV: 54173; F9: 685
#  FL: 3260; HA: 342; MO: 26397; OO: 32; UA: 58665; US: 20536; VX: 5162; WN: 12275; YV: 601
SELECT COUNT(carrier), carrier
FROM flights
GROUP BY carrier;

#5 UA is on top with 58665 flights, and OO is on the bottom with 32 flights.
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

#6 Same but with LIMIT 5 in the query; top 5 in descending order: UA, B6, EV, DL, and AA.
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

#7 Same answer as #6.
SELECT carrier, COUNT(*)
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

#8 Question: Which flight company has the worst average arrival delay? Answer: F9 has 21.9207
#  average flight delay - presumably in minutes.
SELECT AVG(arr_delay), carrier
FROM flights
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;