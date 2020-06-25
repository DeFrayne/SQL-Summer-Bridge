SELECT *
FROM tblcuisine
JOIN tblrecipes
ON tblcuisine.cuisine_id = tblrecipes.cuisine_id;