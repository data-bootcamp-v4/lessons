# Building an API with Flask and Sakila

In the previous lesson, we **consumed** APIs with Python's `requests` library. Now we will **build** an HTTP API that retrieves data from the **Sakila** MySQL database.

We will use a single `main.py` file. During the demonstration, the instructor will explain one section at a time and test its endpoint in the browser.

## 1. Before you start

You need Python, a running local MySQL server, and the **Sakila** sample database installed. The MySQL account you use must have permission to read Sakila's `actor` and `film` tables.

Open a terminal in the folder containing `main.py`.

### Install dependencies with Conda

Activate the Conda environment used for the bootcamp, then install the required libraries:

```bash
conda activate base
conda install -c conda-forge flask pymysql python-dotenv -y
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
 * Running on http://127.0.0.1:5000
 * Debugger is active!
```

- `127.0.0.1` means **your own computer** (`localhost`).
- `5000` is the **port** on which Flask listens for HTTP requests.
- **Keep this terminal open:** the server occupies it while running. It is not frozen; it is waiting for requests.
- Use a **second terminal** for other commands, or use a browser to send requests.
- To stop the server, return to the first terminal and press **Ctrl + C** (on macOS, *Control*, not *Command*).
- `debug=True` enables automatic reloading when you save changes to `main.py`. It is for **local development only**, never production.

## 4. Test the endpoints in your browser

With the server running, visit these addresses:

| HTTP method | URL | Expected response |
| --- | --- | --- |
| GET | `http://127.0.0.1:5000/` | `Hello world!` |
| GET | `http://127.0.0.1:5000/actors` | JSON list of actors |
| GET | `http://127.0.0.1:5000/movies` | JSON list of movies |
| GET | `http://127.0.0.1:5000/search_movies?title=ACADEMY` | JSON list of movies with `ACADEMY` in the title |

The `/search_movies` endpoint uses SQL `LIKE` with `%` wildcards to perform a **partial-text search**. For example, `title=ACADEMY` can match `ACADEMY DINOSAUR`. This is **not** typo-tolerant or fuzzy matching.

Try these additional cases:

| URL | Meaning | HTTP response |
| --- | --- | --- |
| `/search_movies` | Required `title` is missing | `400 Bad Request`, JSON error |
| `/search_movies?title=` | Empty `title` | `400 Bad Request`, JSON error |
| `/search_movies?title=XYZNOTFOUND` | Valid search with no matching movies | `200 OK`, `[]` |

**Important:** `GET /movies` returns *all* movies; `GET /search_movies?title=...` filters by partial title. The SQL uses a parameter placeholder (`%s`) rather than inserting user input into the query string.

## 5. What happens when you open an endpoint?

```text
Browser (HTTP GET request)
          |
          v
Flask route (Python function)
          |
          v
PyMySQL -> MySQL / Sakila
          |
          v
Python dictionaries -> jsonify() -> JSON response
          |
          v
Browser displays the response
```

The `get_db_connection()` function creates a MySQL connection. `DictCursor` returns each SQL row as a dictionary, which Flask can serialize into JSON. Each database endpoint closes its connection even if its SQL query fails. Database failures return HTTP 500 and a generic error message; technical details are logged in the server terminal.

## 6. Consume your own API with requests

While the Flask server is running in the first terminal, you can execute this code in a Python session or notebook:

```python
import requests
import pandas as pd

response = requests.get(
    "http://127.0.0.1:5000/search_movies",
    params={"title": "ACADEMY"},
    timeout=10,
)
response.raise_for_status()

movies = response.json()
df = pd.DataFrame(movies)
print(df.head())
```

Notice that `params={"title": "ACADEMY"}` generates the same query parameter that you typed in the browser. The client does **not** need direct access to the MySQL database.

## 7. Troubleshooting

- **Connection refused in the browser:** Flask is not running, or you are using the wrong port.
- **HTTP 500 from a database endpoint:** Check that MySQL is running, Sakila is installed, your `.env` credentials are correct, and the account can read the tables. Inspect the server terminal for details.
- **Port 5000 already in use:** Stop the process using that port or choose a different local port in `main.py` and update the URLs accordingly.
- **Changes do not appear:** Save `main.py` and check the terminal for reload messages or Python errors.

## Next: FastAPI

We will implement **the same four endpoints** using FastAPI. This lets us compare the frameworks while keeping the HTTP interface and the Sakila SQL queries equivalent.
