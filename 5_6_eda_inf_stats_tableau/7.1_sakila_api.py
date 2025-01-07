from flask import Flask, jsonify, request
import pymysql

# Initialize Flask app
app = Flask(__name__)

def get_db_connection():
    try:
        connection = pymysql.connect(
            user='your_username',           # Replace with your username
            password='your_password',       # Replace with your password
            database='sakila',              # Sakila database
            cursorclass=pymysql.cursors.DictCursor
        )
        return connection
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None
    

@app.route("/actors", methods=["GET"])
def get_actors():
    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Failed to connect to database."}), 500

    with connection.cursor() as cursor:
        query = "SELECT actor_id, first_name, last_name FROM actor;"
        cursor.execute(query)
        actors = cursor.fetchall()

    connection.close()
    return jsonify(actors)


@app.route("/movies", methods=["GET"])
def get_movies():
    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Failed to connect to database."}), 500

    with connection.cursor() as cursor:
        query = "SELECT film_id, title, description, release_year FROM film;"
        cursor.execute(query)
        movies = cursor.fetchall()

    connection.close()
    return jsonify(movies)



@app.route("/search_movies", methods=["GET"])
def search_movies():
    title = request.args.get("title", "")
    if not title:
        return jsonify({"error": "Title parameter is required."}), 400

    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Failed to connect to database."}), 500

    with connection.cursor() as cursor:
        query = """
            SELECT film_id, title, description, release_year
            FROM film
            WHERE title LIKE %s;
        """
        cursor.execute(query, (f"%{title}%",))
        movies = cursor.fetchall()

    connection.close()
    return jsonify(movies)


if __name__ == "__main__":
    app.run(debug=True)