"""A small Flask API that reads data from the Sakila MySQL database."""

import os

import pymysql
from dotenv import load_dotenv
from flask import Flask, jsonify, request


# 1. Configure the application and load credentials from .env.
load_dotenv()
app = Flask(__name__)


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
@app.route("/", methods=["GET"])
def hello():
    return "Hello world!"


# 3. Return all actors as a JSON list.
@app.route("/actors", methods=["GET"])
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
        app.logger.exception("Database error in /actors")
        return jsonify({"error": "Database request failed."}), 500

    # DictCursor produces dictionaries, which jsonify converts to JSON.
    return jsonify(actors)


# 4. Return all movies.
@app.route("/movies", methods=["GET"])
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
        app.logger.exception("Database error in /movies")
        return jsonify({"error": "Database request failed."}), 500

    return jsonify(movies)


# 5. Search for movies whose titles CONTAIN the supplied text.
# Example: http://127.0.0.1:5000/search_movies?title=ACADEMY
# No title -> HTTP 400. No matching movies -> empty JSON list [] with HTTP 200.
@app.route("/search_movies", methods=["GET"])
def search_movies():
    # Read the query parameter after the '?' in the URL.
    # The empty string is the default if 'title' is missing.
    title = request.args.get("title", "").strip()

    if not title:
        return jsonify({"error": "Title parameter is required."}), 400

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
        app.logger.exception("Database error in /search_movies")
        return jsonify({"error": "Database request failed."}), 500

    return jsonify(movies)


# 6. Run Flask's development server from the terminal: python main.py
if __name__ == "__main__":
    # Debug mode reloads the server after edits. NEVER use it in production.
    app.run(host="127.0.0.1", port=5000, debug=True)
