# E-commerce Data Loading Script

## Data Resources

Access the data files [here](https://drive.google.com/drive/u/0/search?q=data).

dDesign: ![design](design)



## Overview
This script loads various datasets related to an e-commerce platform into a PostgreSQL database. The datasets include information about aisles, departments, products, orders, and order products. The script ensures that the database schema is properly set up and that data integrity is maintained by checking for valid order IDs.

## Requirements
- Python 3.x
- pandas
- psycopg2
- SQLAlchemy

## Installation
Install the required packages using pip:

```bash
pip install pandas psycopg2 sqlalchemy
```

## Usage

1. **Prepare the CSV Files**: Ensure that the following CSV files are available in a directory named `data`:

   - `aisles.csv`
   - `departments.csv`
   - `order_products.csv`
   - `orders.csv`
   - `products.csv`

2. **Run the Script**: Execute the script in your Python environment. It will connect to the PostgreSQL database and load the data.

3. **Database Configuration**: Adjust the connection parameters (`dbname`, `user`, `password`, `port`) as necessary to match your PostgreSQL setup.

## Notes

- The script randomly samples 10,000 rows from the `order_products` and `orders` datasets to manage memory usage.
- Temporary tables are created and dropped as needed to maintain data integrity.
