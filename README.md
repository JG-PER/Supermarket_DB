# Supermarket Database Project

**Team:**, Danny Cheng, James Gengerke, Ryan Kinard, Andrew Patilis

## Project Overview

This project is a database system designed for the backend operations of a local supermarket or a chain of supermarkets. Its main goals are to maintain ease of operation, effectively keep track of products and stock levels, and store all necessary data for efficient supermarket management. The system allows users to check item prices and stock quantities using either the product UPC or name.

## Database Design

The database is structured to manage a supermarket's inventory, organizing items by departments and storing detailed product information. Key product details include:
* Product Name
* Product UPC (Universal Product Code)
* Product Brand/Company
* Total in Stock per Product
* Retail Price in USD
* Wholesale Price in USD
* Product Origin (via Vendor Information)

The design adheres to **3rd Normal Form (3NF)**, ensuring no transitive dependencies. An ER Diagram has been mapped for this database.

## Schema Details

The database consists of several key tables:

### Main Product Tables (e.g., `grocery`)
These tables store the core data for products within specific departments. The `grocery` table is one such example.
* **Columns:**
    * `productName VARCHAR(512)`
    * `productUPC VARCHAR(15)`
    * `productCompany VARCHAR(512)`
    * `totalInStock INT`
    * `retailPrice DECIMAL(8,2)`
    * `wholesalePrice DECIMAL(8,2)`
    * `vendorCode INT` (acts as a foreign key to `vendorInfo`)
* **Example SQL for `grocery` table creation:**
    ```sql
    create table grocery (
        productName varchar(512),
        productUPC varchar(15),
        productCompany varchar(512),
        totalInStock int,
        retailPrice decimal(8,2),
        wholesalePrice decimal(8,2),
        vendorCode int
    );
    ```
   
* **Example `INSERT` statement for `grocery`:**
    ```sql
    insert into grocery (productName, productUPC, productCompany, totalInStock, retailPrice, wholesalePrice, vendorCode)
    values
    ('Pure Leaf Lower Sugar Subtly Sweet Peach Real Brewed Tea, 16.9 oz, 6 count', '00012000213571', 'Lipton', 100, 8.29, 3.99, 1);
    ```

### `vendorInfo` Table
This table provides details about the vendors, distinguishing between commissaries and companies.
* **Columns:**
    * `vendorCode INT` (Primary Key)
    * `vendorName VARCHAR(255)`
    * `vendorType VARCHAR(255)` (e.g., 'commissary', 'company')
* **Purpose:** Connects `vendorCode` to the main product tables to indicate product origin.
* **Example SQL for `vendorInfo` table creation and insertion:**
    ```sql
    create table vendorInfo (
        vendorCode int,
        vendorName varchar(255),
        vendorType varchar(255)
    );

    insert into vendorInfo (vendorCode, vendorName, vendorType)
    values
    (1, 'Keasby', 'commissary'),
    (2, 'Bayonne', 'commissary'),
    (3, 'AriZona', 'company'),
    (4, 'Coca-Cola', 'company'),
    (26, 'Chattem Inc.', 'company'),
    (91, 'Advil', 'company'),
    (256, 'Pictsweet Farms', 'company'),
    (300, 'Conagra Brands', 'company');
    ```

### `totalStock` Table (Summary Table)
This special table summarizes the total number of products available for sale within each department. It is derived by summing all in-stock items for each department.
* **Columns:**
    * `Items INT`
    * `Departments VARCHAR(255)`
* **Example SQL (as per presentation):**
    ```sql
    create table totalStock (
        Items int,
        Departments varchar(255)
    );

    insert into totalStock (items)
    select sum(totalInStock) as groceryTotal from grocery;
    update totalStock set Departments=('grocery')
    where Items=(select sum(totalInStock) as groceryTotal from grocery);
    ```
   
    *Note: The presentation indicates multiple versions of the insert/update queries are used for each department (e.g., nonfoods, frozen, dairy). An example result is `7108, grocery`.*

### `totalSold` Table (Summary Table)
This table shows the quantity of products sold in each department for the current day.
* **Columns:**
    * `department VARCHAR(255)`
    * `totalSold INT`
* **Functionality:** In a practical application, this table would be updated by Point of Sale (POS) systems and reset daily. The presentation shows it with set values.
* **Example SQL for `totalSold` table creation and insertion:**
    ```sql
    create table totalSold (
        department varchar(255),
        totalSold int
    );

    insert into totalSold (department, totalSold)
    values
    ('Grocery', 539),
    ('Non-Foods', 302),
    ('Frozen', 418),
    ('Dairy', 498);
    ```

## Data Input

The project envisions data entry screens for populating the database.
* A mockup for an "Add Products to Supermarket Database" screen is included in the project documentation, allowing input for department, product name, UPC, company, retail/wholesale price, and vendor code.
* The `vendorInfo` table would also require a separate data entry screen in practice.
* Product data insertion would involve generating and running SQL `INSERT` queries based on submitted data.

## Data Dictionary / Key Terminology

* **Company:** Refers to the entity that manufactures the product. In the context of `vendorInfo`, it also describes a vendor that ships products in complete pallets.
* **Commissary:** A warehouse or storage facility that stores purchased products for distribution, often shipping them out as mixed pallets.
* **productUPC:** The Universal Product Code, a unique identifier for each product.
* **vendorCode:** An indicator of a product's origin, specifying whether it comes from a Commissary or a Company.