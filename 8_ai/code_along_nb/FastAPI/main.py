"""A small FastAPI API that reads data from the Sakila MySQL database."""

import logging
import os

import pymysql
import uvicorn
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import PlainTextResponse


# 1. Configure the application and load credentials from .env.
load_dotenv()
app = FastAPI()

# FastAPI generates documentation automatically (no extra routes needed):
# http://127.0.0.1:8000/docs         -> Swagger UI (interactive)
# http://127.0.0.1:8000/redoc        -> ReDoc (alternative documentation)
# http://127.0.0.1:8000/openapi.json -> OpenAPI specification (JSON)
logger = logging.getLogger(__name__)  # Used to log database errors.



def get_db_connection():
    """Open a connection to the local Sakila database."""
    return pymysql.connect(
        host="localhost",
        user=os.getenv("db_username"),
        password=os.getenv("db_password"),
        database="sakila",
        cursorclass=pymysql.cursors.DictCursor,
    )


# 2. A simple endpoint: no database connection needed.
@app.get("/", response_class=PlainTextResponse)
def hello():
    return "Hello world!"


# 3. Return all actors as a JSON list.
@app.get("/actors")
def get_actors():
    try:
        connection = get_db_connection()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT actor_id, first_name, last_name FROM actor;"
                )
                actors = cursor.fetchall()
        finally:
            connection.close()  # Also closes the connection if the SQL query fails.
    except pymysql.MySQLError:
        logger.exception("Database error in /actors")
        raise HTTPException(status_code=500, detail="Database request failed.")

    # DictCursor produces dictionaries, which FastAPI converts to JSON.
    return actors


# 4. Return all movies.
@app.get("/movies")
def get_movies():
    try:
        connection = get_db_connection()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT film_id, title, description, release_year FROM film;"
                )
                movies = cursor.fetchall()
        finally:
            connection.close()
    except pymysql.MySQLError:
        logger.exception("Database error in /movies")
        raise HTTPException(status_code=500, detail="Database request failed.")

    return movies


# 5. Search for movies whose titles CONTAIN the supplied text.
# Example: http://127.0.0.1:8000/search_movies?title=ACADEMY
# No title -> HTTP 400. No matching movies -> empty JSON list [] with HTTP 200.
@app.get("/search_movies")
def search_movies(title: str = Query(default="")):
    # FastAPI reads 'title' from the URL query string automatically.
    # The empty string is the default if 'title' is missing.
    title = title.strip()

    if not title:
        raise HTTPException(status_code=400, detail="Title parameter is required.")

    # LIKE with % on both sides matches partial titles.
    # Escape LIKE's special characters so user input is treated as literal text.
    safe_title = title.replace("!", "!!").replace("%", "!%").replace("_", "!_")
    pattern = f"%{safe_title}%"

    try:
        connection = get_db_connection()
        try:
            with connection.cursor() as cursor:
                query = """
                    SELECT film_id, title, description, release_year
                    FROM film
                    WHERE title LIKE %s ESCAPE '!';
                """
                # The placeholder %s keeps user input separate from SQL syntax.
                cursor.execute(query, (pattern,))
                movies = cursor.fetchall()
        finally:
            connection.close()
    except pymysql.MySQLError:
        logger.exception("Database error in /search_movies")
        raise HTTPException(status_code=500, detail="Database request failed.")

    return movies


# 6. Run the development server from the terminal: python main.py
if __name__ == "__main__":
    # Reload mode restarts the server after edits. NEVER use it in production.
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
