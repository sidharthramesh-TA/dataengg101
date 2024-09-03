import pandas as pd
from sqlalchemy import create_engine
import yaml

# Load database connection parameters from a YAML file
def load_db_config(config_path):
    with open(config_path, 'r') as file:
        return yaml.safe_load(file)


db_config_path = '/home/sid/Desktop/copilot/ingest/params.yaml'  # Path to the YAML config file
db_params = load_db_config(db_config_path)['pandas']
db_user = db_params['user']
db_password = db_params['password']
db_database = db_params['database']

# Create database engine
engine = create_engine(f'postgresql://{db_user}:{db_password}@localhost:5432/{db_database}')

# Load data from staging table
df_customer = pd.read_sql_table('staging_customer_dim', engine)

# Load data into customer_dim
df_customer.to_sql('customer_dim', engine, if_exists='append', index=False)

# Load data from staging table
df_product = pd.read_sql_table('staging_product_dim', engine)

# Load data into customer_dim
df_product.to_sql('product_dim', engine, if_exists='append', index=False)

# Load data from staging table
df_staging_sales = pd.read_sql_table('staging_sales_fact', engine)

# Load data into sales_fact
df_staging_sales.to_sql('sales_fact', engine, if_exists='append', index=False)


print('Data loaded into dimension and fact tables.')