.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet from students where color = "blue" and pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color , pet , song from students where color = "blue" and pet = "dog";


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color from students as a, students as b where a.pet = b.pet and a.song = b.song and a.time < b.time;


CREATE TABLE sevens AS
  SELECT s.seven from students as s, numbers as n where s.time = n.time and  s.seven = 7 and n.'7' = "True";

CREATE TABLE favpets AS
  SELECT s.pet, COUNT(*) as count from students as s group by pet order by count desc limit 10;


CREATE TABLE dog AS
  SELECT pet, COUNT(pet) from students where pet = "dog";


CREATE TABLE bluedog_agg AS
  SELECT song, count(song)  as count from bluedog_songs group by song order by count desc;


CREATE TABLE instructor_obedience AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

