# Food App - Complete Project Overview

Welcome to the **Food App**, a robust and comprehensive web-based food delivery and restaurant management system. 
This README serves as the primary gateway to understanding the entire project, its purpose, its structure, and how to get it running.

## 🌟 Project Purpose
The Food App is designed to bridge the gap between hungry customers and local restaurants. 
It provides a seamless, end-to-end flow where:
1. **Customers** can browse local restaurants, view detailed menus, add items to a virtual cart, and securely place orders.
2. **Administrators** are given a powerful, secure dashboard to manage the platform (adding new restaurants, updating food prices, and tracking customer orders).

## 🏗️ Complete Project Structure
Understanding this structure is key to understanding the project. The codebase follows the **MVC (Model-View-Controller)** pattern combined with the **DAO (Data Access Object)** pattern.

```text
food-app/
├── src/main/java/
│   ├── com.food.servlets/      # User Controllers (Login, Checkout, Cart, Profile)
│   ├── com.food.admin/         # Admin Controllers (Dashboard, Manage Restaurants/Menus)
│   ├── com.tap.model/          # Data Models (User, Restaurant, Menu, Order, Cart)
│   ├── com.tap.DAO/            # DAO Interfaces (Defining database operations)
│   ├── com.tap.DAOImpl/        # DAO Implementations (Actual MySQL Queries)
│   └── com.tap.utility/        # Utilities (DBConnection.java)
│
├── src/main/webapp/            # Public-Facing Frontend Views
│   ├── css/                    # Stylesheets for the public UI
│   ├── images/                 # Static assets (Food photos, logos)
│   ├── admin/                  # Secured Admin UI
│   │   ├── css/                # Admin-specific stylesheets
│   │   ├── dashboard.jsp       # Admin control panel
│   │   └── ...                 # Other admin management pages
│   ├── WEB-INF/                
│   │   ├── lib/                # Dependencies (mysql-connector, jbcrypt)
│   │   └── web.xml             # Deployment descriptor
│   ├── home.jsp                # Landing page
│   ├── cart.jsp                # Shopping cart interface
│   ├── checkout.jsp            # Order finalization
│   └── ...                     # Other public JSP/HTML pages
```

### Layer Breakdown
- **The Model Layer (`com.tap.model`)**: Pure Java classes (POJOs) that represent the data. 
- **The View Layer (`webapp/`)**: JSP and HTML files that the user actually sees and interacts with in their browser.
- **The Controller Layer (`com.food.servlets` & `com.food.admin`)**: Java Servlets that catch the user's clicks, process logic, and talk to the database.
- **The Data Access Layer (`com.tap.DAOImpl`)**: The only place in the app where SQL queries exist. It cleanly separates database logic from the rest of the application.

## 🚀 Key Features

### Customer Portal
- **Secure Authentication**: Registration and Login backed by JBCrypt password hashing.
- **Dynamic Catalog**: Real-time browsing of active restaurants and their respective menus.
- **Session-Based Cart**: Users can seamlessly add/remove items without lag; data is stored in the session until checkout.
- **Checkout & History**: Secure order placement and a dedicated page to view past order history.

### Admin Dashboard
- **Analytics**: A high-level overview of total users, active restaurants, and pending orders.
- **Entity Management**: Full CRUD (Create, Read, Update, Delete) capabilities for Restaurants and Menus.
- **Order Tracking**: Ability to view all customer orders placed on the platform.

## 🛠️ Technology Stack
- **Frontend**: HTML5, CSS3, JSP (JavaServer Pages)
- **Backend**: Java 8+, Servlets (Apache Tomcat)
- **Database**: MySQL 8.0+
- **Security**: JBCrypt (Password Hashing)

## ⚙️ Setup and Installation Guide

### 1. Database Configuration
1. Open your MySQL client (e.g., MySQL Workbench).
2. Create a new database named `food_app_db`.
3. Execute the SQL scripts (derived from the ER diagram) to create the `users`, `restaurants`, `menus`, `order_table`, and `order_items` tables.
4. Open `src/main/java/com/tap/utility/DBConnection.java` and update the `URL`, `USERNAME`, and `PASSWORD` to match your local MySQL configuration.

### 2. Project Deployment (Eclipse IDE)
1. Clone or download this repository.
2. Open Eclipse and navigate to `File -> Import -> Existing Projects into Workspace`.
3. Select the `food-app` folder.
4. Ensure Apache Tomcat (v9.0 or higher) is configured in your Eclipse environment.
5. Right-click the project -> `Build Path -> Configure Build Path`. Ensure the JAR files in `src/main/webapp/WEB-INF/lib` (MySQL Connector and JBCrypt) are added.
6. Right-click the project -> `Run As -> Run on Server`.
7. Access the application in your browser at: `http://localhost:8080/food-app/`

---
*Note: For deep technical dives into specific layers, please refer to the separately provided `Frontend_Documentation`, `Backend_Documentation`, `Database_Documentation`, `Comprehensive_System_Diagrams`, and `Overall_Project_Documentation` files.*
