#Database is called ytvideos and was created usign the MySQL Workbench UI.

# 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
# video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
# other publicly available resources.

#Videos Table Creation
CREATE TABLE videos
(
video_id int PRIMARY KEY,
title text,
minlen int,
seclen int,
url text NOT NULL
);

#Inserting 3 YouTube Videos into the database.
INSERT INTO videos(video_id, title, minlen, seclen, url)
VALUES(1, 'How mother dogs handle disrespectful puppies', 4, 8, 'https://www.youtube.com/watch?v=08einOI3wlo');
INSERT INTO videos(video_id, title, minlen, seclen, url)
VALUES(2, 'How mother dogs handle disrespectful puppies: Part 2', 5, 15, 'https://www.youtube.com/watch?v=RK_dlJ2u2RY');
INSERT INTO videos(video_id, title, minlen, seclen, url)
VALUES(3, 'How mother dogs handle disrespectful puppies Part 3', 9, 35, 'https://www.youtube.com/watch?v=2HwYfFvwjYE');

# 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
# at least two of the videos. These should be imaginary reviews that include columns for the user’s name
# (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
# (“Loved it!”). There should be a column that links back to the ID column in the table of videos.


#Reviews Table Creation
CREATE TABLE reviews
(
review_id int PRIMARY KEY,
reviewer text,
rating int,
review text NOT NULL,
video_id int NOT NULL REFERENCES videos
);

#Review creations.
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(1, 'Jane', 4, 'This was great!', 1);
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(2, 'Joe', 3, 'It was okay.', 1);
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(3, 'Molly', 1, 'More of the same.', 2);
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(4, 'Bernie', 5, 'Must watch!', 2);
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(5, 'Fonzie', 5, 'Ayyyyy!', 2);
INSERT INTO reviews(review_id,reviewer,rating,review,video_id)
VALUES(6, 'Michelle', 2, 'Third time\'s a charm!', 3);

# 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

# Perform a join on both tables.
SELECT *
FROM videos
JOIN reviews ON videos.video_id=reviews.video_id;
