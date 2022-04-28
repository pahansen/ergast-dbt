import os
from dotenv import load_dotenv

load_dotenv()

ERGAST_CSV_FOLDER_PATH = os.environ.get("ERGAST_CSV_FOLDER_PATH")
POSTGRES_USER = os.environ.get("POSTGRES_USER", "postgres")
POSTGRES_PASSWORD = os.environ.get("POSTGRES_PASSWORD", "mysecretpassword")
POSTGRES_SERVER = os.environ.get("POSTGRES_PASSWORD", "localhost")
POSTGRES_PORT = os.environ.get("POSTGRES_PORT", 5432)
