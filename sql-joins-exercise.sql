-- Join two tables regardless of owner_id

SELECT * 
FROM owners
FULL JOIN vehicles
ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner 

SELECT o.first_name, o.last_name, COUNT(*)
FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
ORDER BY o.first_name ASC;

-- Count the number of cars for each owner & the average price

SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) AS average_price, COUNT(*)
FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
HAVING ROUND(AVG(v.price)) > 10000
ORDER BY o.first_name DESC;

