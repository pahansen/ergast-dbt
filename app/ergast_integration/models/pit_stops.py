"""Model for Ergast Pitstops data."""
from sqlalchemy import Column, Integer, String
from app.ergast_integration.db.db_config import Base, BaseClass


class Pitstop(Base, BaseClass):
    __tablename__ = "pitstops"

    raceId = Column(Integer)
    driverId = Column(Integer)
    stop = Column(Integer)
    lap = Column(Integer)
    lap = Column(Integer)
    time = Column(String)
    duration = Column(String)
    milliseconds = Column(Integer)
