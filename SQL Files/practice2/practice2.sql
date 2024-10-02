SELECT * FROM book WHERE title LIKE '%u%';

SELECT author_name FROM book WHERE price<600;

SELECT title, price FROM book WHERE price > 50 AND price < 500;

INSERT INTO publisher (name, city, state, country) VALUES ('MacLehose Press', NULL, NULL, 'United Kingdom');

INSERT INTO book (title, author_name, author_address, price, advance, royalty, pubdate, pub_id) VALUES 
('The Girl with the Dragon Tattoo', 'Steig Larsson', 'Sweden', 545.00, 150000, 0.15, '2008-01-10', 3);

SELECT book_id, title FROM book ORDER BY price ASC LIMIT 10;

SELECT title FROM book WHERE title LIKE '%Lord of the Rings%' OR title LIKE '%A Song of Ice and Fire%';

SELECT b.title AS 'Title of Book', b.author_name AS 'Name of Author', p.name AS 'Name of Publisher' FROM book b JOIN publisher p ON
b.pub_id = p.pub_id ORDER BY p.name ASC, b.author_name ASC;

SELECT DISTINCT author_name AS 'Author has Name with T' FROM book WHERE author_name LIKE '%t%';