# sql_py_connection


import pymysql
from sqlalchemy import create_engine
from urllib.parse import quote_plus
import pandas as pd

-------------------------------------------------------------------

# Connection parameters
host = "localhost"
user = "root"
password = "Krishna@2007"

# Connect to the MySQL server
connection = pymysql.connect(host=host, user=user, password=password)

# Create a cursor object to interact with the database
cursor = connection.cursor()

# SQL query to create a new database named "codebasics2"
database_name = "codebasics2"
create_database_query = f"CREATE DATABASE IF NOT EXISTS {database_name}"

# Execute the query
cursor.execute(create_database_query)

# Commit the changes and close the connection
connection.commit()
connection.close()

-------------------------------------------------------------------


# Database connection parameters
host = "localhost"
user = "root"
password = "Krishna@2007"
database = "codebasics2"  # Replace with your actual database name

# Encoding the password for the connection string
encoded_password = quote_plus(password)

# Creating the SQLAlchemy engine
engine = create_engine(f"mysql+pymysql://{user}:{encoded_password}@{host}/{database}")

# Assuming df2 is your DataFrame
df2 = pd.read_excel(r"D:\dim_customer.xlsx")

# Upload DataFrame to MySQL table named 'df2'
df2.to_sql("df2", con=engine, if_exists='replace', index=False)
