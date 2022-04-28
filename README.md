# Decsription
This project shows a little playground for using [Ergast F1](http://ergast.com/mrd/) data with dbt and PostgreSQL. 

# How to run
In order to run the project, you first need to have an empty PostgreSQL database running. Easiest setup is probably running the docker command below.

    docker run --name ergast-dbt-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres

Once the database is ready and you have installed the requirements from app/requirements.txt the data from the Ergast CSV download needs to be imported. 

    python -m app.ergast_integration.import_csv

Make sure to create a .env file on root folder level of this project and include the path to your folder containing the raw Ergast CSV data as ERGAST_CSV_FOLDER_PATH.
