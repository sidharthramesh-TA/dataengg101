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
db_ip = db_params['host']

# Replace these variables with your actual file path and database credentials
csv_file_path = '/home/sid/Desktop/copilot/data/customers.csv'
table_name = 'landing_customers'

# Read CSV file
df = pd.read_csv(csv_file_path)

# Create database engine
engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_ip}/{db_database}')

# Ingest CSV data into PostgreSQL database
df.to_sql(table_name, engine, if_exists='replace', index=False)  # Use 'append' to add data to an existing table

print('Loaded')