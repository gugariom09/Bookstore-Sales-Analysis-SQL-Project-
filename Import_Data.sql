-- Data Import

-- Import Data into Books Table

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'D:\Data Analyst\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table

COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'D:\Data Analyst\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'D:\Data Analyst\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Orders.csv' 
CSV HEADER;
