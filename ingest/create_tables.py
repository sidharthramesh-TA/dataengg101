import os
import psycopg2
import yaml

# Load database connection parameters from a YAML file
def load_db_config(config_path):
    with open(config_path, 'r') as file:
        return yaml.safe_load(file)

# Directory containing your .sql files
sql_files_dir = "/home/sid/Desktop/copilot/table/"

def execute_sql_file(cursor, file_path):
    with open(file_path, 'r') as file:
        sql_script = file.read()
    cursor.execute(sql_script)

def main():
    db_config_path = '/home/sid/Desktop/copilot/ingest/params.yaml'  # Path to the YAML config file
    db_params = load_db_config(db_config_path)
    try:
        # Connect to the database
        conn = psycopg2.connect(**db_params['pandas'])
        cursor = conn.cursor()
        
        # Iterate over .sql files and execute them
        for file_name in os.listdir(sql_files_dir):
            if file_name.endswith('.sql'):
                file_path = os.path.join(sql_files_dir, file_name)
                print(f"Executing {file_name}...")
                execute_sql_file(cursor, file_path)
                conn.commit()
                print(f"Executed {file_name} successfully.")
                
        cursor.close()
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        if conn is not None:
            conn.close()

if __name__ == "__main__":
    main()


