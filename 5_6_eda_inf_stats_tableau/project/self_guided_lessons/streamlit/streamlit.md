# Self-Guided Content: Introduction to Streamlit for Data Applications


## Overview
Streamlit is an open-source Python library that makes it easy to create and share beautiful, custom web apps for machine learning and data science. In just a few minutes you can build and deploy powerful data applications. This lesson introduces the basics of Streamlit and guides you through creating your first web application, focusing on a business case using the supermarket_sales.csv dataset.

## Objectives
By the end of this lesson, you will be able to:

- Understand what Streamlit is for.
- Install and set up Streamlit.
- Create a basic Streamlit application.
- Understand how to add different types of widgets.
- Load and display data within your Streamlit application.
- Deploy a Streamlit app to share with others.

## Business Case

We'll be using `supermarket_sales.csv` file. You can find it [here](https://raw.githubusercontent.com/data-bootcamp-v4/data/main/supermarket_sales.csv). 

The dataset contains 1000 entries with 17 columns. Here's a brief overview of the columns present:

- `Invoice ID`: Identification number of the invoice.
- `Branch`: Branch of the supermarket (e.g., A, B, or C).
- `City`: City where the supermarket branch is located.
- `Customer type`: Type of customer (e.g., Member or Normal).
- `Gender`: Gender of the customer.
- `Product line`: Category of the item purchased.
- `Unit price`: Price of one unit of the product.
- `Quantity`: Number of products purchased.
- `Tax 5%`: Tax amount for the purchase.
- `Total`: Total amount for the purchase (including tax).
- `Date`: Date of the purchase.
- `Time`: Time of the purchase.
- `Payment`: Payment method (e.g., Cash, Credit card, Ewallet).
- `cogs`: Cost of goods sold.
- `gross margin percentage`: Gross margin percentage.
- `gross income`: Gross income from the purchase.
- `Rating`: Customer rating for the shopping experience.

With this information, we can plan a Streamlit application that might include the following features:

1. A filterable and sortable table to view the sales data.
2. Summary statistics for sales, such as total revenue, average sales per day, and average rating.
3. Visualizations for sales trends over time.
4. An interactive widget enabling users to filter sales data by customer rating, dynamically updating the data table, summary statistics, and sales trend visualizations in real-time.

## Application Development

Certainly! Here's a more complete and polished English version of the text:

## Understanding the Role of Streamlit in Application Development

When developing any software, be it a website, mobile app, or another form of digital service, there are two fundamental components that come into play:

- **The Backend**: This is the code that runs on the server side, handling the logic of the application. It is responsible for managing interactions with the database, processing data, and performing the core functionalities of the application. In our case, the backend will consist of Python code that performs data loading, processing, and analysis.
  
- **The Frontend**: This is the user interface that allows for interaction with the software. It's what the users see and interact with, consisting of the layout, design, and interactive elements that enable users to perform tasks within the application. In this scenario, our frontend will be a web page created through Streamlit, which converts our Python scripts into interactive web apps.

To get started, let's set up a directory structure for our project. Within this directory, create a Python file dedicated to your backend functions—let's name this file `backend.py`. This will help us maintain a clean separation of concerns, with `backend.py` containing the data processing logic and another file, such as `app.py`, containing the Streamlit code that defines the user interface.

## Backend

Inside `backend.py` we'll write the following functions.

### Step 1: Load the Data

```python
def load_data():
    data = pd.read_csv('supermarket_sales.csv')
    data['Date'] = pd.to_datetime(data['Date'])
    return data
```

### Step 2: Summarize the Data

We want to show some summary statistics on our dashboard:

```python
def get_summary(data):
    summary = pd.DataFrame({
        'Total Sales': [data['Total'].sum()],
        'Average Rating': [data['Rating'].mean()],
        'Total Transactions': [data['Invoice ID'].nunique()]
    })
    return summary
```

### Step 3: Visualize the Data

Create a function to plot sales over time:

```python
def plot_sales_over_time(data):
    data['Date'] = pd.to_datetime(data['Date'])
    sales_over_time = data.groupby(data['Date'].dt.date)['Total'].sum()
    plt.figure(figsize=(10, 5))
    plt.plot(sales_over_time.index, sales_over_time.values)
    plt.title('Sales Over Time')
    plt.xlabel('Date')
    plt.ylabel('Total Sales')
    plt.xticks(rotation=45)
    plt.tight_layout()
    st.pyplot(plt)
```

### backend.py

This is how our file looks like:

```python
import pandas as pd
import matplotlib.pyplot as plt

def load_data():
    data = pd.read_csv("https://raw.githubusercontent.com/data-bootcamp-v4/data/main/supermarket_sales.csv")
    data['Date'] = pd.to_datetime(data['Date'])
    return data

def get_summary(data):
    summary = pd.DataFrame({
        'Total Sales': [data['Total'].sum()],
        'Average Rating': [data['Rating'].mean()],
        'Total Transactions': [data['Invoice ID'].nunique()]
    })
    return summary

def plot_sales_over_time(data):
    data['Date'] = pd.to_datetime(data['Date'])
    sales_over_time = data.groupby(data['Date'].dt.date)['Total'].sum()
    plt.figure(figsize=(10, 5))
    plt.plot(sales_over_time.index, sales_over_time.values)
    plt.title('Sales Over Time')
    plt.xlabel('Date')
    plt.ylabel('Total Sales')
    plt.xticks(rotation=45)
    plt.tight_layout()
    return plt
```

## Frontend - Streamlit

### Introduction to Streamlit

**What is Streamlit?**

Streamlit is an open-source app framework designed with the intention of simplifying the process of creating and sharing beautiful, custom web apps for machine learning and data science. In a short period, Streamlit has gained immense popularity due to its ease of use and the ability to transform data scripts into shareable web apps with minimal effort.

Streamlit sits at the intersection of data analysis and web development, allowing data scientists and analysts to turn data exploration scripts into interactive dashboards without requiring the expertise of web developers. Its integration with Python, one of the most popular programming languages in the data science community, makes it an ideal tool for a wide range of applications, from quick prototypes to complex data applications.

**The Streamlit workflow**

A typical Streamlit app is structured as a Python script, which contains a mixture of standard Python code and calls to Streamlit's library of functions. Streamlit apps are inherently linear, much like a script, which makes the flow of information and the structure of the app easy to understand and modify.

When a Streamlit app is run, the script is executed from top to bottom. As the script runs, Streamlit draws the app in the browser, translating Python code into the frontend elements on the fly. This means every time a user interacts with the app, the script re-runs from the top, updating the app with the new state.

**Advantages of using Streamlit for data projects**

Streamlit offers several key advantages that make it especially attractive for building data-driven applications:

- **Quick Iteration and Deployment**: Streamlit's design allows for rapid prototyping. Changes made to the script are immediately reflected in the app, making the development process highly efficient. Moreover, Streamlit provides a straightforward deployment solution with Streamlit sharing, which hosts apps with minimal configuration.

- **Minimal Front-End Coding Required**: Users do not need to know HTML, CSS, or JavaScript to create fully functional web applications. Streamlit abstracts away the complexities of web development, allowing creators to focus on Python code.

- **Rich Set of Widgets and Interactive Features**: Streamlit comes with a variety of widgets that can be easily integrated into the app, such as sliders, buttons, and text input, enabling developers to build interactive features with just a few lines of code.


### Installation and Setup

#### Installing Streamlit using pip

Streamlit is a Python library, and installing it is as simple as installing any other Python package using pip. However, it's considered good practice to install Python packages in a virtual environment to avoid version conflicts and keep your global installation clean. Here's how to set it up:

1. **Creating a Virtual Environment**: 
   - Open your terminal or command prompt.
   - Navigate to the directory where you want to create your project.
   - Run `python3 -m venv streamlit_env` to create a new virtual environment named `streamlit_env`.

2. **Activating the Virtual Environment**: 
   - On Windows, run `streamlit_env\Scripts\activate`.
   - On macOS and Linux, run `source streamlit_env/bin/activate`.

3. **Installing Streamlit**: 
   - With the virtual environment activated, install Streamlit by running `pip install streamlit`.
   - Once the installation is complete, you can verify it by running `streamlit hello`. This command will open up a welcome page in your default web browser, indicating that Streamlit has been installed successfully.

#### Setting up your first Streamlit script

Creating a Streamlit app is as straightforward as writing a simple Python script. Here's how you can get started:

   - In your project directory, create a new Python file with a `.py` extension, such as `app.py`.
   - Open this file in your favorite code editor.
   - At the top of your script, import Streamlit with `import streamlit as st`. We will also the functions we created in `backend.py `.

Here's a simple example of what your script might look like:

```python
import streamlit as st
from backend import load_data, get_summary, plot_sales_over_time
```

Make sure both `app.py` and `backend.py` are in the same directory, or adjust the import statement in `app.py` to reflect the path to `backend.py` if it's located elsewhere.

#### Running a Streamlit application locally

Once your script is ready, you can run it locally to see your application in action:

1. **Running the Script**:
   - In your terminal, ensure you're in the same directory as your script and your virtual environment is activated.
   - Run the command `streamlit run app.py`.
   - Streamlit will start a local server and automatically open your default browser to show your app.

2. **Understanding the Local Server**:
   - The terminal will show you the address of the local server (usually `http://localhost:8501`).
   - You can open this address in any web browser to view your app.
   - If you make changes to your script, Streamlit will automatically detect the changes and update the app in the browser.


### Building Blocks of Streamlit

Streamlit offers a variety of building blocks to create interactive and visually appealing web apps quickly. This section will guide you through the basics of writing to your app, displaying data, adding widgets for interactivity, and structuring your app's layout.

We'll create a `main()` function in `app.py` that will have inside all the code related to the Streamlit application.

```python
def main():
	# here will go our code
```

#### Writing to the app with `st.write()`

Streamlit's `st.write()` function is a versatile way to display text, data, and even charts. Here's how to use it:

- **Displaying Text**: Simply pass a string to `st.write('Your text here')` to display it in the app.
- **Formatting Text**: Streamlit supports Markdown, which means you can use `st.write('**Bold Text**')` to bold text or `st.write('# Heading')` for headings.
- **Displaying Code**: Use `st.code('x = 10')` to display code snippets neatly.
- **Displaying a Title**: Use `st.title()` to add a title to the app.
- **Displaying a Table**: Use `st.table()` to add a table to the app.

We call the functions we created in `backend.py` to load the data and get summary statistics, and we then use st.write() and st.table() (inside *main* function in `app.py`) to add an introductory text and the summary statistics. 

```python
st.title('Supermarket Sales Dashboard')

data = load_data()
summary = get_summary(data)

st.write("### Summary Statistics")
st.table(summary)
```

#### Displaying data using `st.dataframe()`

Data is at the heart of most Streamlit apps, and `st.dataframe()` makes it easy to show tables of data:

- **Loading a CSV File**: Use Pandas to read a CSV file with `df = pd.read_csv('dataset.csv')`.
- **Displaying Data**: Pass the dataframe to `st.dataframe(df)` to display it in your app.
- **Customizing Display**: Streamlit dataframes are interactive by default, but you can customize their width and height with `st.dataframe(df, width=500, height=300)`.

Let's display the raw dat using st.dataframe().

```python
st.write("### Raw Data")
st.dataframe(data)
```
 
#### Displaying Charts and Graphs

Streamlit has built-in functions to help you create interactive charts and graphs, which can be customized to convey the right insights.

- **Interactive Charts**: Utilize functions like `st.line_chart()`, `st.bar_chart()`, and `st.area_chart()` for quick, interactive visualizations.
- **Custom Charts**: For more control over your charts, use libraries like Matplotlib or Plotly with Streamlit. For example, create a Plotly chart and display it with `st.plotly_chart(fig)`.
- **Chart Customization**: Enhance your charts by customizing them with titles, axis labels, and color schemes to make them more informative and visually appealing. 


We could add the sales over time plot to streamlit just by doing the following: 


```python
# Plotting
st.write("### Sales Over Time")
plt = plot_sales_over_time(data)
st.pyplot(plt)
```


#### Adding interactivity with widgets

Widgets are what make your Streamlit app interactive. Here's how to add them:

- **Overview of Widgets**: Streamlit includes a wide range of widgets, such as `st.button()`, `st.slider()`, `st.checkbox()`, and more.
- **Capturing User Input**: When a user interacts with a widget, it returns a value that you can use in your app. For example, `if st.button('Click Me'): st.write('Button clicked!')`.
- **Using Widgets**: You can use widgets to take user input and then use that input to display data or update your app. For example, `age = st.slider('Select your age', 0, 100)` lets users select an age, which you can then use to filter a dataset.
- **User-driven Data Display**: You can display subsets of data based on user input. For instance, using a dropdown to select a column to display: `selected_column = st.selectbox('Select a column', df.columns)`.
- **Dynamic Data Loading**: Combine user input with dataframe manipulation to update data displays, such as using a slider to filter rows based on a value: `st.dataframe(df[df['Age'] > st.slider('Age filter', min_value=18, max_value=100)])`.

Previously, our Streamlit code statically displayed the supermarket sales data, summary statistics, and sales trends without any user interaction:

```python
def main():
    st.title('Supermarket Sales Dashboard')

    data = load_data()
    summary = get_summary(data)
    
    # Display summary stats
    st.write("### Summary Statistics")
    st.table(summary)
    
    # Display raw data
    st.write("### Raw Data")
    st.dataframe(data)
    
    # Plotting
    st.write("### Sales Over Time")
    plot_sales_over_time(data)
```

To enhance user engagement and provide tailored insights, we'll introduced an interactive widget—specifically, a slider in the sidebar that allows users to set a minimum rating threshold. The addition of this widget transforms our application into a dynamic dashboard.

- **The `data` variable is now `filtered_data`**: This change reflects the application's new ability to filter the dataset based on the rating selected by the user.
- **Updated Summary and Visualizations**: The summary statistics and sales trend plots automatically update to show information relevant to the user's selected rating criteria.

Here's the updated code with the interactive rating filter:

```python
def main():
    st.title('Supermarket Sales Dashboard')

    # Load data 
    data = load_data()
    
    # Interactive widgets
    st.sidebar.header('Controls')
    min_rating = st.sidebar.slider('Minimum Rating', min_value=0, max_value=10, value=5, step=1)
    
    # Filter by rating
    filtered_data = data[data['Rating'] >= min_rating]

    # Summary statistics
    updated_summary = get_summary(filtered_data)
    st.write("### Summary Statistics")
    st.table(updated_summary)

    # Display raw data
    st.write("### Raw Data")
    st.dataframe(filtered_data)

    # Plotting
    st.write("### Sales Over Time")
    plt = plot_sales_over_time(filtered_data)
    st.pyplot(plt)
```


#### Using layout options and containers

A well-structured layout is crucial for user experience. Streamlit provides containers and layout options to help:

- **Columns and Expanders**: Use `st.columns()` to create side-by-side layouts and `st.expander()` to create sections that users can expand or collapse.
- **Organizing Content**: `with st.container():` creates a container where you can place your widgets and other app elements, which helps in organizing your app's content.
- **Visually Appealing Layouts**: Combining these layout options allows you to build complex and attractive app designs. For example:

```python
col1, col2 = st.columns(2)
with col1:
    st.header('Column 1')
    st.write('Here is some content')
with col2:
    st.header('Column 2')
    st.write('Here is some more content')
```

We won't be using them now.

#### Run the App

Include the following code at the end of your script to make it executable:

```python
if __name__ == '__main__':
    main()
```
 
This means that if `app.py` is run directly (for example, by running `streamlit run app.py` in the command line), then the `main()` function will be called. If `app.py` is imported into another Python file (using `import app`), the `main()` function will not be called, preventing the app from starting a new Streamlit server.

#### Caching Data to Speed Up Your App

Streamlit's caching allows for efficient loading of data, which is especially useful for apps that work with large datasets or require heavy computations.

- **Using `@st.cache`**: Decorate your data loading functions with `@st.cache` to prevent Streamlit from reloading data upon each user interaction.

Modify `backend.py` to include `@st.cache` at the top of `load_data()`.

```python
@st.cache
def load_data():
    data = pd.read_csv('supermarket_sales.csv')
    data['Date'] = pd.to_datetime(data['Date'])
    return data
```

- **Best Practices for Caching**:
  - Only cache data loading functions that load static data or data that does not change often.
  - Be mindful of cache invalidation. Changing the function's code, its dependencies, or input parameters will clear the cache and reload the data.
  - Use caching parameters like `allow_output_mutation=True` if your function returns large objects that don't change, or `suppress_st_warning=True` to hide cache-related warnings.

### The Streamlit App

Your `app.py` should look like this:

```python

import streamlit as st
from backend import load_data, get_summary, plot_sales_over_time

def main():
    st.title('Supermarket Sales Dashboard')

    # Load data 
    data = load_data()
    
    # Interactive widgets
    st.sidebar.header('Controls')
    min_rating = st.sidebar.slider('Minimum Rating', min_value=0, max_value=10, value=5, step=1)
    
    # Filter by rating
    filtered_data = data[data['Rating'] >= min_rating]

    # Summary statistics
    updated_summary = get_summary(filtered_data)
    st.write("### Summary Statistics")
    st.table(updated_summary)

    # Display raw data
    st.write("### Raw Data")
    st.dataframe(filtered_data)

    # Plotting
    st.write("### Sales Over Time")
    plt = plot_sales_over_time(filtered_data)
    st.pyplot(plt)
    


if __name__ == '__main__':
    main()
```

Save your script as `app.py`.

### Deploying Your Streamlit App

The final step in the Streamlit development process is deployment, which allows your app to be accessible by users on the web.

DStreamlit provides a platform called Streamlit Sharing, which can host apps for free.

#### Preparing Your App for Deployment

Before deploying, make sure your app is polished and ready for public interaction.

- **Test Locally**: Run your Streamlit app locally to ensure everything works as expected.
- **Requirements File**: Create a `requirements.txt` file that lists all Python libraries your app depends on. You can generate this file by running `pip freeze > requirements.txt` in your virtual environment.
- **Repository**: Your application should be in a Git repository, preferably on GitHub. Ensure all files, including `requirements.txt`, are committed and pushed to the repository.
	- To put your code into a Git repository and push it to GitHub, you can either use GitHub Desktop, or follow these steps:

	##### Step 1: Initialize Git Repository
	
	1. Open a terminal or command prompt.
	2. Navigate to your project folder using `cd path/to/your/project`.
	3. Initialize the local directory as a Git repository with:
	
	```sh
	git init
	```
	
	##### Step 2: Add Files to Repository
	
	1. Add all the files in your project to the staging area with:
	
	```sh
	git add .
	```
	
	The `.` after `add` tells Git to include all files in the directory. If you want to add specific files, replace `.` with the file names.
	
	2. Now commit the changes to your repository with a message describing the initial commit:
	
	```sh
	git commit -m "Initial commit"
	```
	
	##### Step 3: Create a GitHub Repository
	
	1. Go to [GitHub](https://github.com/) and sign in.
	2. Click on the "New repository" icon in the upper-right corner.
	3. Name your repository and optionally add a description.
	4. Keep the repository public if you want to share it with others.
	5. Do not initialize the repository with a README, .gitignore, or license since you already have files in your local repository.
	
	##### Step 4: Link Local Repository to GitHub
	
	After creating the repository on GitHub, you’ll be given a URL for that repository. Copy that URL to link your local repository to GitHub with:
	
	```sh
	git remote add origin <repository-URL>
	```
	
	Replace `<repository-URL>` with the URL of your new GitHub repository. It will look something like this:
	
	```sh
	git remote add origin https://github.com/data-bootcamp-v4/streamlit-sales.git
	```
	
	##### Step 5: Push Code to GitHub
	
	Finally, push your code from your local repository to GitHub with:
	
	```sh
	git push -u origin main
	```
	
	The `-u` flag sets the upstream for your local repository, which makes it easier to push changes in the future. You can simply use `git push` for subsequent pushes after the initial one.
	
	##### Step 6: Confirm Upload
	
	1. Refresh your GitHub repository page, and you should now see your code there.
	2. If you have files that you don't want to upload (temporary files, sensitive configuration, etc.), you should add a `.gitignore` file to your project directory and list those files before the initial commit.
	
	Remember that pushing to a public GitHub repository means that your code will be visible to everyone. Do not push any sensitive information like passwords or API keys. Use environment variables or GitHub secrets for that.

#### Deploying Your App Using Streamlit Sharing

- **Deployment Guide**:
  - Link your GitHub repo to Streamlit sharing and deploy your app.
	  - **Sign up and log in to Streamlit Sharing**: Go to [share.streamlit.io](https://share.streamlit.io) and log in with your GitHub account.
		- **New App**: Click on 'New app', then select your GitHub repository, the branch where your app is located, and the path to your Streamlit app file (e.g., `app.py`).
		- **Advanced Settings**: If needed, add any additional environment variables or secrets your app requires to function.
		- **Deploy**: Click 'Deploy' to deploy your app. Streamlit will set up a container for your app, install all the required dependencies, and start running your app.
			- If you get an error, such as ModuleNotFoundError, pointing to matplotlib, this usually means that the `matplotlib` library is not installed in the Python environment where your Streamlit app is running. To resolve this issue:
				- Ensure `matplotlib` is in `requirements.txt`: Check if you have a `requirements.txt` file in your project folder and ensure that it includes `matplotlib`. If it's not there, add it:
				```
				matplotlib==3.4.2  # Use the version appropriate for your application
				```
				
			    - Then, commit and push this change to your GitHub repository.
				
				- Re-deploy on Streamlit Sharing 
		- **Sharing Your App**: Once deployed, you will receive a URL that you can share with others so they can access your Streamlit app online.
- **Monitoring Your App**:
  - Once deployed, monitor your app’s health and usage through the Streamlit sharing dashboard.
  - Regularly check the logs for any errors or issues that users may encounter.

Great! To incorporate the interactive Streamlit dashboard as a bonus in the Streamlit lesson, you can structure the additional content like this:

---

## Bonus Activity: Adding More Interactive Widgets

The writing is quite clear, but a few minor tweaks can improve the flow and clarity:

---

## Bonus Activity: Enhancing Interactivity with Additional Widgets

**Objective**:

In this supplementary exercise to our primary Streamlit lesson, we will deepen our practical skills by augmenting our supermarket sales dashboard with more interactive elements. This will allow for even more dynamic exploration of the dataset.

You are encouraged to tackle this as a hands-on exercise. Alternatively, you can study the provided *app_bonus.py* script to comprehend the enhancements.

**Activity**:

Enhance the dashboard by integrating a range of new filters:
   - Introduce a Multiselect box to choose specific product lines for a tailored analysis.
   - Implement another Multiselect box to select and view data for certain cities.
   - Employ Radio buttons to segregate data based on gender.
   - Utilize Radio buttons to differentiate between customer types.

Ensure that the filters dynamically update the data used for summary statistics, data viewing, and the sales-over-time plot based on the user's input from the sidebar widgets.


