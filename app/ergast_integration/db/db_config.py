"""PostgreSQL setup."""
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy import Column, Integer
from sqlalchemy import create_engine
from app.config import POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_SERVER, POSTGRES_PORT


engine = create_engine(
    f"postgresql+psycopg2://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_SERVER}:{POSTGRES_PORT}",
    echo=True,
)

Session = sessionmaker(bind=engine)
Base = declarative_base()


class BaseClass:
    id = Column(Integer, primary_key=True)
