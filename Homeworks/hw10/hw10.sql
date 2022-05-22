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
  SELECT dogs.name, sizes.size
    FROM dogs, sizes
    WHERE dogs.height > sizes.min
    AND dogs.height <= sizes.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child as name
    FROM parents
    ORDER BY (SELECT height
                FROM dogs
                WHERE dogs.name = parents.parent) DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT dog1.child AS name1, 
         dog2.child AS name2, 
         dog1_size.size AS t_size
    FROM parents AS dog1, 
         parents AS dog2, 
         size_of_dogs AS dog1_size, 
         size_of_dogs AS dog2_size
    WHERE dog1.child = dog1_size.name
    AND dog2.child = dog2_size.name
    AND dog1.parent = dog2.parent
    AND dog1.child < dog2.child
    AND dog1_size.size = dog2_size.size;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || name1 || " plus "
         || name2 || " have the same size: " || t_size
    FROM siblings;
