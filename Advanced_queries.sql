-- Advanced Queries

-- 1) Retrieve the total number of books sold for each genre:
SELECT b.genre, SUM(o.quantity) AS book_qty
FROM Books b
INNER JOIN 
	Orders o
ON b.book_id = o.book_id
GROUP BY genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS average
FROM Books
WHERE genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name,COUNT(o.order_id) AS order_count
FROM Customers c
JOIN 
	Orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

-- 4) Find the most frequently ordered book:
SELECT o.book_id,b.title,COUNT(o.order_id) AS count_ord
FROM Books b 
INNER JOIN 
	Orders o
ON o.book_id = b.book_id
 GROUP BY o.book_id,b.title
 ORDER BY count_ord DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM Books
WHERE Genre = 'Fantasy' 
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT b.Author, SUM(o.quantity) AS book_count
FROM Orders o
 JOIN Books b
 ON o.book_id = b.book_id
 GROUP BY b.Author;

 -- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT  c.city, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE total_amount >300;

-- 8) Find the customer who spent the most on orders: 
SELECT c.customer_id, c.name, sum(o.total_amount) AS TOTAL_SPEND
FROM Orders o
JOIN customers c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY TOTAL_SPEND DESC LIMIT 1 ;					

-- 9)Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title,SUM(b.stock), COALESCE(sum(o.quantity),0) as sold_stock , 
	SUM(b.stock) - COALESCE(sum(o.quantity),0) AS REMAINING_STOCK
FROM Books b
LEFT JOIN 
Orders o ON b.book_id = o.book_id 
GROUP BY b.book_id ORDER BY b.book_id ;

-- 10)Find top 3 customers by total spending and show their details
SELECT c.customer_id, c.name,
	SUM(o.total_amount) AS total_spent
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY SUM(o.total_amount) DESC
LIMIT 3

-- 11)Rank books based on total quantity sold (best-selling books),
SELECT b.book_id,
	   b.title,
	   SUM(o.total_amount) AS best_selling_books,
	   RANK()OVER(ORDER BY sum(o.total_amount)DESC) AS rn 
FROM orders o 
JOIN books b ON o.book_id = b.book_id 
GROUP BY b.book_id, b.title

	
-- 12)Find the top-selling book in each genre 
SELECT * 
	FROM(
		SELECT b.book_id, b.title, b.genre, 
			SUM(o.total_amount) AS top_selling_books,
			ROW_NUMBER()OVER(PARTITION BY b.genre ORDER BY SUM(o.total_amount)DESC) AS rn
		FROM orders o 
	JOIN books b ON o.book_id = b.book_id 
GROUP BY b.book_id, b.title, b.genre
)t 
WHERE rn = 1