CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name as name, size as size from dogs, sizes where height > min and height <= max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT ch.name from dogs as ch, dogs as pa, parents
  where ch.name = child and pa.name = parent order by pa.height desc;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as child1, b.child as child2, s1.size as size1, s2.size as size2 from parents as a, parents as b, size_of_dogs as s1, size_of_dogs as s2
  where a.parent = b.parent and a.child < b.child and a.child = s1.name and b.child = s2.name and s1.size = s2.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT child1 || " and " || child2 || " are " || size1 || " siblings"
  from siblings;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);
-- Add your INSERT INTOs here


CREATE TABLE stacks AS


