import mysql.connector
from mysql.connector import Error

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='root',
            database='proyecto_espirometro_bi'
        )
        return connection
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        return None

if __name__ == '__main__':
    conn = get_db_connection()
    if conn is not None and conn.is_connected():
        db_Info = conn.get_server_info()
        print(f"Conectado a MySQL Server versión {db_Info}")
        cursor = conn.cursor()
        cursor.execute("SELECT DATABASE();")
        record = cursor.fetchone()
        print(f"Conectado a la base de datos: {record[0]}")
        cursor.close()
        conn.close()
