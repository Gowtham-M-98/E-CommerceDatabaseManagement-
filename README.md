# E-Commerce Database Management

### Description

This project involves designing a **relational database schema** for an e-commerce platform. The database includes essential tables such as **Products, Customers, Orders, OrderDetails, and Categories**. The implementation supports processing orders, and managing customer information efficiently.

### Features

- Structured schema for managing products, customers, and orders.

- Order processing system to handle customer purchases.

- Categorization of products for better organization.

### Database Schema

The database consists of the following tables:

- **Products:** Stores details about the available products.

- **Customers:** Maintains customer information.

- **Orders:** Captures order-related data.

- **OrderDetails:** Links products with specific orders, including quantity and price.

- **Categories:** Organizes products into categories.

### Technologies Used

- SQL (MySQL)

- Relational Database Management System (RDBMS)

### Queries and Analysis

The project includes various SQL queries and data analysis tasks to extract valuable insights from the e-commerce's data. Some of the key queries implemented include:

**1. JOIN** - To retrieve data from multiple tables in a relational database, the JOIN clause can be used to combine records based on Orders, OrderDetails, Customers, Products tables for the detailed order list.

**2. VIEW** - Created a VIEW that provides an order summary along with customer information.

**3. SUBQUERY** - To retrieve customers who have placed orders with a total value exceeding Rs.10,000, a SUBQUERY is used.

**4. STORED PROCEDURE** - To get first highest order and second highest order amount across all customers, a STORED PROCEDURE is used.
