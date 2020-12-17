CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- creating a table named authors in lab14_normal database
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
-- getting the the unique valuse of author from the books table and insert into authors table in the name colomn
ALTER TABLE books ADD COLUMN author_id INT;
-- adding a colomn named author_id to books table
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
-- connecting both tables by the name of the author
ALTER TABLE books DROP COLUMN author;
-- deleting the author colomn from books table
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
-- changing the data type of author_id in books table to foreign key with reference of the primary key in authors table