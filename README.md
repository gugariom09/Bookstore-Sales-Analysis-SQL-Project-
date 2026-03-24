 📚 Bookstore Sales Analysis (SQL Project)

 📌 Overview

This project analyzes bookstore sales data using SQL.
It focuses on extracting meaningful business insights from transactional data by working with relational tables.

---

 🧱 Database Schema

The project is built using three main tables:

 🔹 Books

Stores details about books such as title, author, genre, price, and stock.

 🔹 Customers

Contains customer information including name, city, and country.

 🔹 Orders

Transaction table that records book purchases, including quantity and total amount.

---

 🧩 Data Model


<p align="center">
<img width="800" height="564" alt="ER-Diagram" src="https://github.com/user-attachments/assets/b2b23146-327b-431e-9eae-e6eb4726dce3" />
</p>


The database follows a **relational model (Star Schema)**:

* **Orders** → Fact Table (transactions)
* **Books & Customers** → Dimension Tables

 🔗 Relationships:

* One customer can place multiple orders (1:M)
* One book can be ordered multiple times (1:M)

The **Orders table acts as a bridge** connecting Customers and Books.

---

 📊 Sample Data Preview:

* The following image shows a preview of the Books table, providing an understanding of the dataset structure:

  <p align="center">
<img width="800" height="656" alt="Table preview" src="https://github.com/user-attachments/assets/1a73fc5a-580a-4a32-a34f-18925d5e7796" />
  </p>

---
 🛠 Tools & Technologies

* PostgreSQL
* SQL (Joins, Aggregations, Window Functions)

---

🔍 Business Questions Solved

 📊 Basic Analysis

* Retrieve books by genre
* Find books published after a certain year
* Identify customers by location
* Filter orders by date
* Calculate total stock and revenue

 📈 Intermediate Analysis

* Total books sold per genre
* Average book price by category
* Customers with multiple orders
* Most frequently ordered book
* Top expensive books

  🚀 Advanced Analysis

* Top customers by total spending
* Ranking books based on sales
* Top-selling books within each genre
* Remaining stock after fulfilling orders

---
 📊 Query Results
🔝 Top-Selling Book in Each Genre

 * This query uses a window function (ROW_NUMBER with PARTITION BY) to identify the best-selling book within each genre.

    <p align="center">
<img width="800" height="683" alt="Advanced Query" src="https://github.com/user-attachments/assets/84c13ec4-e5b1-4d98-8ecc-c67afc96ac1c" />
   </p>
   
    💰 Customer with Highest Spending

 * This query identifies the customer who has spent the most across all orders using aggregation and joins.

   <p align="center">
<img width="800" height="530" alt="Join Query" src="https://github.com/user-attachments/assets/e8393f7e-51cb-4802-8e99-025ce809892e" />
   </p>

---

 📊 Key Insights

* Fiction genre contributes significantly to total sales
* A small group of customers generates a large portion of revenue
* Certain books have low remaining stock and require restocking
* High-value customers are concentrated in specific cities
* Sales patterns vary across genres and pricing segments

---

 ▶️ How to Run

1. Create tables using `create_tables.sql`
2. Import data using `data_import.sql`
3. Run queries from:

   * `basic_queries.sql`
   * `advanced_queries.sql`

---

 📁 Project Structure

```text
bookstore-sql-analysis/
│── data/
│── sql/
│── screenshot/
│── README.md
```

---

 💡 Learnings

* Designing relational database schemas
* Writing efficient SQL queries using joins and aggregations
* Using window functions for ranking and analysis
* Converting raw data into business insights

---

 ⭐ Conclusion

This project demonstrates how SQL can be used to analyze structured data, generate insights, and support business decision-making.

---

⭐ If you like this project, feel free to star the repository!
