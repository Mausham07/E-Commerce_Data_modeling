## Overview

**Project Title**: E-commerce Data Loading Script

**Project Description**:  
This project consists of a script designed to load various e-commerce datasets into a PostgreSQL database. The datasets include details about aisles, departments, products, orders, and order products. The script establishes the database schema, checks data integrity by validating order IDs, and handles data loading efficiently.

**Project Goals**:  
- Automate the process of loading e-commerce data into a PostgreSQL database.
- Ensure data integrity through schema setup and validation checks.
- Optimize data handling to manage memory usage effectively.

## Instructions for Build and Use

### Steps to build and/or run the software:

1. **Install Dependencies**: Use `pip` to install the required packages:
   ```bash
   pip install pandas psycopg2 sqlalchemy

## Prepare CSV Files

Ensure the following CSV files are available in a directory named `data` and you can acess these file from [data](https://drive.google.com/drive/folders/1stFuRQCpOv4reFB0286-GAV2wzkiQpHs?usp=sharing):

- `aisles.csv`
- `departments.csv`
- `order_products.csv`
- `orders.csv`
- `products.csv`

## Configure Database

Adjust the connection parameters (`dbname`, `user`, `password`, `port`) in the script to match your PostgreSQL setup.

## Instructions for Using the Software

- **Run the Script**: Execute the script in your Python environment. It connects to PostgreSQL and loads the data.
- **Data Sampling**: The script randomly samples 10,000 rows from the `order_products` and `orders` datasets to optimize memory usage.
- **Temporary Tables**: Temporary tables are created and dropped as needed during the data loading process to ensure data integrity.

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

- Python 3.x
- PostgreSQL
- pandas
- psycopg2
- SQLAlchemy

## Useful Websites to Learn More

I found these websites useful in developing this software:

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)
- [pandas Documentation](https://pandas.pydata.org/docs/)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

- [ ] Improve error handling during the database connection phase.
- [ ] Automate schema creation based on data file structure.
- [ ] Implement logging to track the progress and errors during data loading.

