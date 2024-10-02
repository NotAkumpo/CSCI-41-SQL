SELECT c.customerno AS 'Customer Number', CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name', o.orderno AS 'Order Number', o.orderdate AS
'Date of Order', o.shipdate AS 'Date of Shipping' FROM customer c JOIN orders o ON c.customerno=o.customerno WHERE c.state='FL' ORDER BY
o.orderdate ASC;

SELECT p.contact AS 'Contact Name', p.name AS 'Publisher Name', p.phone AS 'Phone' FROM publisher p JOIN book b ON b.pubID=p.pubID
WHERE b.category='Children';

SELECT b.title AS 'Book Title', CONCAT(a.fname, ' ', a.lname) AS "Author's Name" FROM book b JOIN bookauthor ba ON b.ISBN=ba.ISBN JOIN 
author a ON ba.authorid=a.authorID WHERE b.category='Family Life';

SELECT o.orderno, SUM(oi.quantity) AS 'Number of Items' FROM customer c JOIN orders o ON c.customerno=o.customerno JOIN orderitem oi 
ON o.orderno=oi.orderno WHERE c.firstname='JAKE' AND c.lastname='Lucas' AND o.orderdate='2003-03-31';

SELECT CONCAT(cn.firstname, ' ', cn.lastname) AS 'Customer Name', CONCAT(cr.firstname, ' ', cr.lastname) AS 'Referred By' FROM 
customer cn JOIN customer cr ON cn.referredby=cr.customerno;

SELECT c.customerno AS 'Customer Number', CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name', o.orderno AS 'Order Number', o.orderdate 
AS 'Order Date' FROM customer c LEFT JOIN orders o ON c.customerno=o.customerno ORDER BY c.customerno ASC;

SELECT b.title, b.category FROM customer c JOIN orders o ON c.customerno=o.customerno JOIN orderitem oi ON o.orderno=oi.orderno JOIN book b 
ON oi.ISBN=b.ISBN WHERE c.firstname='Leila' AND c.lastname='Smith';