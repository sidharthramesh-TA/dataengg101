import psycopg2

def delete_all_tables():
    try:
        # Connect to your postgres DB
        conn = psycopg2.connect("dbname=pg user=postgres password=admin1234 host=localhost")

        # Open a cursor to perform database operations
        cur = conn.cursor()

        # Fetch all table names
        cur.execute("""
            SELECT table_name FROM information_schema.tables
            WHERE table_schema = 'public'
        """)
        tables = cur.fetchall()

        # Drop each table
        for table in tables:
            cur.execute(f"DROP TABLE IF EXISTS {table[0]} CASCADE")
            print(f"Table {table[0]} deleted.")

        # Commit the changes
        conn.commit()

        # Close communication with the database
        cur.close()
        conn.close()
    except Exception as e:
        print(f"An error occurred: {e}")

# Call the function
delete_all_tables()