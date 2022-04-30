"""Model for Ergast Drivers data."""
from sqlalchemy import Column, String
from app.ergast_integration.db.db_config import BaseClass, Base


class Driver(Base, BaseClass):
    __tablename__ = "drivers"

    driverId = Column(String)
    driverRef = Column(String)
    number = Column(String)
    code = Column(String)
    forename = Column(String)
    surname = Column(String)
    dob = Column(String)
    nationality = Column(String)
    url = Column(String)