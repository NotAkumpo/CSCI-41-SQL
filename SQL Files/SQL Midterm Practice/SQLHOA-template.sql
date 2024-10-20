/*
	This is the template for the SQL Hands-On Activity Solution.
	StudentGivenName StudentLastName (IDNumber)
	SubmissionDate

	I have not discussed the SQL language code in my program 
	with anyone other than my instructor or the teaching assistants 
	assigned to this course.

	I have not used SQL language code obtained from another student, 
	or any other unauthorized source, either modified or unmodified.

	If any SQL language code or documentation used in my program 
	was obtained from another source, such as a textbook or website, 
	that has been clearly noted with a proper citation in the comments 
	of my program.
*/

select * from ;

-- 1. title of the most expensive computer book

SELECT b.title AS 'Title', b.retail AS 'Price', p.name AS 'Publisher Name' FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE
b.retail=(SELECT MAX(retail) FROM book WHERE category='Computer') AND b.category='Computer';

-- 2. customers who referred other customers

SELECT DISTINCT rr.customerno AS 'Customer Number', CONCAT(rr.firstname, ' ', rr.lastname) AS 'Customer Name' FROM customer rr JOIN customer rd ON 
rr.customerno=rd.referredby WHERE rd.referredby IS NOT NULL; 

-- 3. books priced higher than the average price

SELECT b.ISBN AS 'ISBN', b.title AS 'Book Title', b.retail AS 'Retail Price', p.name AS 'Publisher' FROM book b JOIN publisher p ON 
b.pubID=p.pubID WHERE b.retail>(SELECT AVG(retail) FROM book); 

-- 4. titles bought by Bonita Morales

SELECT DISTINCT b.ISBN, b.title AS 'Book Title', b.retail AS 'Retail Price' FROM customer c JOIN orders o ON c.customerno=o.customerno JOIN orderitem oi 
ON o.orderno=oi.orderno JOIN book b ON oi.ISBN=b.ISBN WHERE c.firstname='Bonita' AND c.lastname='Morales';

-- 5. publisher of books written by author Tamara Kzochsky

SELECT b.title, b.category, p.name, p.contact, p.phone FROM author a JOIN bookauthor ba ON a.authorID=ba.authorID JOIN book b 
ON ba.ISBN=b.ISBN JOIN publisher p ON b.pubID=p.pubID WHERE a.fname='Tamara' AND a.lname='Kzochsky';

-- 6. books published by the publisher of the book "Big Bear and Little Dove" that generate more profit than the average profit from all books

SELECT b.ISBN, b.title, b.category FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE (b.retail-b.cost)>(SELECT AVG(b.retail-b.cost) FROM 
book b JOIN publisher p ON b.pubID=p.pubID) AND p.name=(SELECT p.name FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE 
b.title='Big Bear and Little Dove');


-- 7. books more expensive than the most expensive cooking book

SELECT b.isbn, b.title, b.category, b.retail FROM book b WHERE b.retail>(SELECT MAX(retail) FROM book WHERE category='Cooking');

-- 8. books that have not been ordered at all

SELECT b.isbn, b.title, b.category, b.retail FROM book b LEFT JOIN orderitem oi ON b.ISBN=oi.ISBN WHERE orderno IS NULL; 

-- 9. orders shipped to the same state as the orders of Steve Schell

SELECT DISTINCT o.orderno AS 'Order Number', o.shipdate AS 'Date of Shippingstate', CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name' FROM orders o
JOIN customer c ON c.customerno=o.customerno WHERE c.state=(SELECT state FROM customer WHERE firstname='Steve' AND lastname='Schell') AND 
NOT firstname='Steve' AND NOT lastname='Schell';

-- 10. sutomers who ordered the least expensive books

SELECT CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name', c.state AS 'State' FROM customer c JOIN orders o ON c.customerno=o.customerno JOIN orderitem oi 
ON o.orderno=oi.orderno JOIN book b ON oi.ISBN=b.ISBN WHERE b.retail=(SELECT MIN(retail) FROM book);

-- end of solution file --