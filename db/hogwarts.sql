DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT4
);

-- CREATE TABLE houses (
--   id SERIAL4 PRIMARY Key,
--   house VARCHAR(255),
--
-- )
