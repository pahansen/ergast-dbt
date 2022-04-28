"""Model for Ergast Results data."""
from sqlalchemy import Column, String
from app.ergast_integration.db.db_config import BaseClass, Base


class Result(Base, BaseClass):
    __tablename__ = "results"

    resultId = Column(String)
    raceId = Column(String)
    driverId = Column(String)
    constructorId = Column(String)
    statusId = Column(String)
    number = Column(String)
    grid = Column(String)
    position = Column(String)
    positionText = Column(String)
    positionOrder = Column(String)
    points = Column(String)
    laps = Column(String)
    time = Column(String)
    milliseconds = Column(String)
    fastestLap = Column(String)
    rank = Column(String)
    fastestLapTime = Column(String)
    fastestLapSpeed = Column(String)
