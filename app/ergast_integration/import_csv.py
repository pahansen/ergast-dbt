"""
Read CSV files from Ergast folder and import into PostgreSQL database.
Staging tables are resetted for each script run.
"""
import csv
from app.config import ERGAST_CSV_FOLDER_PATH
from app.ergast_integration.db.db_config import engine, Base, Session
from app.ergast_integration.models.constructors import Constructor
from app.ergast_integration.models.drivers import Driver
from app.ergast_integration.models.races import Race
from app.ergast_integration.models.pit_stops import Pitstop
from app.ergast_integration.models.results import Result

# Reset tables
Base.metadata.drop_all(engine)
Base.metadata.create_all(engine)

session = Session()

# Import Races
with open(f"{ERGAST_CSV_FOLDER_PATH}/races.csv") as races:
    csvreader = csv.reader(races, delimiter=",")
    next(csvreader, None)
    for row in csvreader:
        session.add(
            Race(
                raceId=row[0],
                year=row[1],
                round=row[2],
                circuitId=row[3],
                name=row[4],
                date=row[5],
                time=row[6],
                url=row[7],
            )
        )

# Import Drivers
with open(f"{ERGAST_CSV_FOLDER_PATH}/drivers.csv") as drivers:
    csvreader = csv.reader(drivers, delimiter=",")
    next(csvreader, None)
    for row in csvreader:
        session.add(
            Driver(
                driverId=row[0],
                driverRef=row[1],
                number=row[2],
                code=row[3],
                forename=row[4],
                surname=row[5],
                dob=row[6],
                nationality=row[7],
                url=row[8]
            )
        )

# Import Constructors
with open(f"{ERGAST_CSV_FOLDER_PATH}/constructors.csv") as constructors:
    csvreader = csv.reader(constructors, delimiter=",")
    next(csvreader, None)
    for row in csvreader:
        session.add(
            Constructor(
                constructorId=row[0],
                constructorRef=row[1],
                name=row[2],
                nationality=row[3],
                url=row[4]
            )
        )

# Import Pit Stops
with open(f"{ERGAST_CSV_FOLDER_PATH}/pit_stops.csv") as races:
    csvreader = csv.reader(races, delimiter=",")
    next(csvreader, None)
    for row in csvreader:
        session.add(
            Pitstop(
                raceId=row[0],
                driverId=row[1],
                stop=row[2],
                lap=row[3],
                time=row[4],
                duration=row[5],
                milliseconds=row[6],
            )
        )

# Import Results
with open(f"{ERGAST_CSV_FOLDER_PATH}/results.csv") as races:
    csvreader = csv.reader(races, delimiter=",")
    next(csvreader, None)
    for row in csvreader:
        session.add(
            Result(
                resultId=row[0],
                raceId=row[1],
                driverId=row[2],
                constructorId=row[3],
                number=row[4],
                grid=row[5],
                position=row[6],
                positionText=row[7],
                positionOrder=row[8],
                points=row[9],
                laps=row[10],
                time=row[11],
                milliseconds=row[12],
                fastestLap=row[13],
                rank=row[14],
                fastestLapTime=row[15],
                fastestLapSpeed=row[16],
                statusId=row[17],
            )
        )
session.commit()
