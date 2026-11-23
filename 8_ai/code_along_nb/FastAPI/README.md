# Building an API with FastAPI and Sakila

We have already built an HTTP API using **Flask**. Now we will implement **the same four endpoints** with **FastAPI**, using the same Sakila MySQL database and SQL queries. Focus on what changes between the frameworks, not on relearning SQL.

We will use a single `main.py` file. During the demonstration, the instructor will explain one section at a time and test its endpoint in the browser.

## 1. Before you start

You need Python, a running local MySQL server, and the **Sakila** sample database installed. The MySQL account must have permission to read Sakila's `actor` and `film` tables.

Open a terminal in the folder containing the **FastAPI** `main.py` file.

### Install dependencies with Conda

```bash
conda activate base
conda install -c conda-forge fastapi uvicorn pymysql python-dotenv -y
```

If you use a different Conda environment, replace `base` with its name. If the environment is already active, you can skip the activation command.

## 2. Configure MySQL credentials

Create a file named `.env` in the **same folder as `main.py`**:

```dotenv
db_username=root
db_password="replace_with_your_mysql_password"
```

Replace the example values with your own MySQL credentials. The variable names match those read by `main.py`. If your MySQL account has no password, use `db_password=""`.

**Never commit `.env` to Git.** Create a `.gitignore` file containing at least:

```gitignore
.env
__pycache__/
```

If you have already committed a credential, adding `.gitignore` does not remove it from Git history; you must also revoke/change the exposed credential.

## 3. Start the API

From the folder containing `main.py`, with your environment activated:

```bash
python main.py
```

You should see output similar to:

```text
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process
```

- `127.0.0.1` means **your own computer** (`localhost`).
- `8000` is the **port** on which Uvicorn serves the FastAPI application.
- **Keep this terminal open:** the server occupies it while running. It is not frozen; it is waiting for requests.
- Use a **second terminal** for other commands, or use a browser to send requests.
- To stop the server, return to the first terminal and press **Ctrl + C** (on macOS, *Control*, not *Command*).
- `reload=True` automatically restarts the development server when you save changes to `main.py`. Use it for **local development only**, never production.

**Important:** Run `python main.py` from the directory containing this file. The reload configuration imports the application using the module name `main`.

## 4. Test the endpoints in your browser

With the server running, visit these addresses:

| HTTP method | URL | Expected response |
| --- | --- | --- |
| GET | `http://127.0.0.1:8000/` | `Hello world!` |
| GET | `http://127.0.0.1:8000/actors` | JSON list of actors |
| GET | `http://127.0.0.1:8000/movies` | JSON list of movies |
| GET | `http://127.0.0.1:8000/search_movies?title=ACADEMY` | JSON list of movies with `ACADEMY` in the title |

The `/search_movies` endpoint uses SQL `LIKE` with `%` wildcards to perform a **partial-text search**. For example, `title=ACADEMY` can match `ACADEMY DINOSAUR`. This is **not** typo-tolerant or fuzzy matching.

Try these additional cases:

| URL | Meaning | HTTP response |
| --- | --- | --- |
| `/search_movies` | Required `title` is missing | `400 Bad Request`, JSON error |
| `/search_movies?title=` | Empty `title` | `400 Bad Request`, JSON error |
| `/search_movies?title=XYZNOTFOUND` | Valid search with no matching movies | `200 OK`, `[]` |

**Important:** `GET /movies` returns *all* movies; `GET /search_movies?title=...` filters by partial title. The SQL uses a parameter placeholder (`%s`) rather than inserting user input into the query string.

### FastAPI's automatic API documentation

One of FastAPI's advantages is that it **generates API documentation automatically**, without writing additional endpoints ourselves.

While the server is running, open:

- `http://127.0.0.1:8000/docs` — **Swagger UI**, interactive documentation for testing requests.
- `http://127.0.0.1:8000/redoc` — **ReDoc**, an alternative documentation interface.
- `http://127.0.0.1:8000/openapi.json` — the **OpenAPI specification** in JSON format, which describes the API.

**Try it yourself:** Open `/docs`, find `GET /search_movies`, click **Try it out**, enter `ACADEMY` for the `title` parameter, and click **Execute**. Compare the response with the one from the URL in your browser.

FastAPI uses route declarations and Python type hints to describe parameters in the documentation. Unlike this FastAPI example, our simple Flask application does not provide these documentation interfaces automatically.

## 5. What happens when you open an endpoint?

```text
Browser (HTTP GET request)
          |
          v
FastAPI route (Python function)
          |
          v
PyMySQL -> MySQL / Sakila
          |
          v
Python dictionaries -> FastAPI JSON response
          |
          v
Browser displays the response
```

The `get_db_connection()` function creates a MySQL connection. `DictCursor` returns each SQL row as a dictionary. FastAPI automatically serializes returned lists and dictionaries to JSON, so we do not need Flask's `jsonify()`.

Each database endpoint closes its connection even if its SQL query fails. Database failures raise `HTTPException(status_code=500, ...)`; technical details are logged in the server terminal.

### A quick note about logging

Instead of relying on `print()` for error messages, web applications can use Python's `logging` module. This application creates a logger with `logging.getLogger(__name__)` and calls `logger.exception(...)` inside database-error handlers. This records an error message **and its traceback** to help diagnose failures. The client still receives a generic HTTP 500 response rather than internal database details.

Our Flask example also uses logging, through `app.logger.exception(...)`.

For an invalid search, FastAPI raises `HTTPException(status_code=400, ...)`. The error body uses a `detail` field rather than Flask's `error` field, but the **HTTP status code and endpoint behavior are the same**.

## 6. Consume your own API with requests

While the FastAPI server is running in the first terminal, execute this code in a Python session or notebook:

```python
import requests
import pandas as pd

response = requests.get(
    "http://127.0.0.1:8000/search_movies",
    params={"title": "ACADEMY"},
    timeout=10,
)
response.raise_for_status()

movies = response.json()
df = pd.DataFrame(movies)
print(df.head())
```

Compare it with the Flask example: **only the port changes** (`5000` vs `8000`). The client does not need to know which Python framework handles the request.

## 7. Troubleshooting

- **Connection refused in the browser:** FastAPI is not running, or you are using the wrong port.
- **HTTP 500 from a database endpoint:** Check that MySQL is running, Sakila is installed, your `.env` credentials are correct, and the account can read the tables. Inspect the server terminal for details.
- **Port 8000 already in use:** Stop the process using that port or choose a different local port in `main.py` and update the URLs accordingly.
- **Changes do not appear:** Save `main.py` and check the terminal for reload messages or Python errors.
- **Import error on startup:** Check that you launched the command from the folder containing `main.py` and that the Conda environment has the dependencies installed.

## 8. Flask vs FastAPI: quick comparison

| Feature | Flask | FastAPI |
| --- | --- | --- |
| Create application | `Flask(__name__)` | `FastAPI()` |
| GET endpoint | `@app.route("/actors", methods=["GET"])` | `@app.get("/actors")` |
| Query parameter | `request.args.get("title", "")` | `title: str = Query(default="")` |
| Return JSON | `jsonify(actors)` | `return actors` |
| HTTP error | `return jsonify({...}), 400` | `raise HTTPException(status_code=400, ...)` |
| Development server | `app.run(debug=True)` | `uvicorn.run("main:app", reload=True, ...)` |
| Automatic API docs | Not included in our Flask example | `/docs`, `/redoc`, `/openapi.json` |
| Database error logging | `app.logger.exception(...)` | `logger.exception(...)` |

**Key idea:** The server implementation changes, but the client can make the same HTTP requests and receive the same successful JSON data.
