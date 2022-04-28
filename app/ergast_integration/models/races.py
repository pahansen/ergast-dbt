"""Model for Ergast Races data."""
from sqlalchemy import Column, Integer, String
from app.ergast_integration.db.db_config import BaseClass, Base


class Race(Base, BaseClass):
    __tablename__ = "races"

    raceId = Column(Integer)
    year = Column(Integer)
    round = Column(Integer)
    circuitId = Column(Integer)
    name = Column(String)
    date = Column(String)
    time = Column(String)
    url = Column(String)
