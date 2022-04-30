"""Model for Ergast Constructors data."""
from sqlalchemy import Column, String
from app.ergast_integration.db.db_config import BaseClass, Base


class Constructor(Base, BaseClass):
    __tablename__ = "constructors"

    constructorId = Column(String)
    constructorRef = Column(String)
    name = Column(String)
    nationality = Column(String)
    url = Column(String)