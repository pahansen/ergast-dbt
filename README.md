# Description
This project shows a little playground for using [Ergast F1](http://ergast.com/mrd/) data with dbt and PostgreSQL. 

# How to run
In order to run the project, you first need to have an empty PostgreSQL database running. Easiest setup is probably running the docker compose file.

    docker-compose up

Once the database is ready and you have installed the requirements from app/requirements.txt the data from the Ergast CSV download needs to be imported. Make sure to create a .env file on root folder level of this project and include the path to your folder containing the raw Ergast CSV data as ERGAST_CSV_FOLDER_PATH.

    python -m app.ergast_integration.import_csv

Alternatively, you can also choose to import the CSV files with SQL and skip the Python part.

Finally, remember to set up your dbt profile for this project including the credentials to the PostgreSQL database.


