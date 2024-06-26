# Credit Card Transactions Data Modelling

This project focuses on fraud detection using a dataset downloaded from Kaggle ([Fraud Detection Dataset](https://www.kaggle.com/kartik2112/fraud-detection)). The dataset consists of 23 columns and 550,000 rows of transaction data. The project involves designing data models for both OLTP (Online Transaction Processing) and OLAP (Online Analytical Processing) databases, loading the dataset into SQL Server, performing analysis in Power BI, and creating dashboards to visualize insights.

## Part 1: Design OLTP Database

In this part, the dataset was loaded into SQL Server, and tables were designed based on the following relationships:
- One customer can have one and only one address, while one address can point to one or many customers.
- One address can have one and only one city, while a city can have many addresses.
- One customer can initiate one or many transactions, while one transaction must have one and only one customer.
- One transaction must have one and only one merchant, while a merchant can be involved in one or many transactions.

#### ER Diagram

<img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Data%20Modeling/OLTP/ERD.png" alt="Database Diagram" width="900" height="400">

## Part 2: Design OLAP Database

The data structured in 3NF normalization in the OLTP database was used to design the data warehouse using SSIS and SQL. Data was loaded from the OLTP source to the data warehouse and stored in a star schema.

#### Star Schema

<img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Data%20Modeling/OLAP/OLAP.png" alt="Database Diagram" width="900" height="500">

#### Data Flow for Loading Src Data to Fact Table 

<img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Data%20Modeling/OLAP/Fact_data_flow.png" alt="Database Diagram" width="900" height="300">

## Part 3: Creating Dashboard with Power BI

Reporting ideas for the dashboard include:
- Analyzing customer behavior
  
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/cust1.png" alt="Database Diagram" width="900" height="300">
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/cust2.png" alt="Database Diagram" width="900" height="420">


  
- Assessing merchant performance
  
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/Merch1.png" alt="Database Diagram" width="900" height="420">
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/merch2.png" alt="Database Diagram" width="900" height="420">


  
- Exploring geographical patterns

  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/state1.png" alt="Database Diagram" width="900" height="420">
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/State2.png" alt="Database Diagram" width="900" height="420">


  
- Examining temporal trends
  <img src="https://github.com/ehsanSh21/BankDWH/blob/master/Screenshots/Power%20Bi/monthly.png" alt="Database Diagram" width="900" height="420">

These reporting ideas provide a comprehensive view of the dataset, enabling actionable insights for decision-making.

Feel free to explore the project further and provide feedback or suggestions for improvement. Let me know if you have any questions or need further information!
