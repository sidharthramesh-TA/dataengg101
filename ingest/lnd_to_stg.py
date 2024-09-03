from sqlalchemy import create_engine
import yaml
import pandas as pd

# Load database connection parameters from a YAML file
def load_db_config(config_path):
    with open(config_path, 'r') as file:
        return yaml.safe_load(file)


# Path to the YAML file containing database connection parameters
db_config_path = '/home/sid/Desktop/copilot/ingest/params.yaml'

# Load the database connection parameters from the YAML file
db_params = load_db_config(db_config_path)['pandas']

# Extract the required parameters from the loaded configuration
db_user = db_params['user']
db_password = db_params['password']
db_database = db_params['database']

# Base JDBC URL
url = f"jdbc:postgresql://localhost:5432/{db_database}"

# Create database engine
engine = create_engine(f'postgresql://{db_user}:{db_password}@localhost:5432/{db_database}')

# Load data from landing table into df_customers
df_customers = pd.read_sql_table('landing_customers', engine)

# Add metadata columns
df_customers['effective_date'] = pd.Timestamp('today').normalize()
df_customers['expiration_date'] = pd.Timestamp('9999-12-31')
df_customers['is_current'] = 'y'

# Write data to staging table
df_customers.to_sql('staging_customer_dim', engine, if_exists='replace', index=False)

print(f'Data ingested into staging table {df_customers.count()}')

# Load data from landing table into df_customers
df_products = pd.read_sql_table('landing_products', engine)

# Add metadata columns
df_products['effective_date'] = pd.Timestamp('today').normalize()
df_products['expiration_date'] = pd.Timestamp('9999-12-31')
df_products['is_current'] = 'y'

# Write data to staging table
df_products.to_sql('staging_product_dim', engine, if_exists='replace', index=False)

print(f'Data ingested into staging table {df_products.count()}')

# Load data from landing table into df_customers
df_sales = pd.read_sql_table('landing_sales', engine)

# Add metadata columns
df_sales['effective_date'] = pd.Timestamp('today').normalize()
df_sales['expiration_date'] = pd.Timestamp('9999-12-31')
df_sales['is_current'] = 'y'

# Write data to staging table
df_sales.to_sql('staging_sales_fact', engine, if_exists='append', index=False)

print(f'Data ingested into staging table {df_products.count()}')

