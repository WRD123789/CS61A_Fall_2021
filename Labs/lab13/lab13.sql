.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet
    FROM students
    WHERE color = "blue"
    AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song
    FROM students
    WHERE color = "blue"
    AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest
    FROM students
    GROUP BY smallest
    HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT name1.pet, name1.song, name1.color, name2.color
    FROM students AS name1
    JOIN students AS name2
    ON name1.pet = name2.pet
    AND name1.song = name2.song
    WHERE name1.time != name2.time;


CREATE TABLE sevens AS
  SELECT seven
    FROM students, numbers
    WHERE students.time = numbers.time
    AND students.number = 7 
    AND numbers."7" = "True";


CREATE TABLE avg_difference AS
  SELECT ROUND(AVG(ABS(number - smallest)))
  FROM students;
