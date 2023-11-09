# app_bonus.py
import streamlit as st  # Import Streamlit for creating web app
from backend import load_data, get_summary, plot_sales_over_time  # Import custom functions from backend.py

def main():
    st.title('Supermarket Sales Dashboard')  # Set the title of the web app

    # Load data from the source using a function defined in backend.py
    data = load_data()

    # Create interactive widgets in the sidebar for user input
    st.sidebar.header('Controls')  # Header for the control section
    # Slider for selecting the minimum rating to filter the data
    min_rating = st.sidebar.slider('Minimum Rating', min_value=0, max_value=10, value=5, step=1)
    # Multiselect box for selecting product lines to include in the analysis
    product_lines = st.sidebar.multiselect('Product Line', options=data['Product line'].unique(), default=data['Product line'].unique())
    # Multiselect box for selecting cities to include in the analysis
    cities = st.sidebar.multiselect('City', options=data['City'].unique(), default=data['City'].unique())
    # Radio buttons for selecting gender to filter the data
    gender = st.sidebar.radio("Gender", ('All', 'Male', 'Female'))
    # Radio buttons for selecting customer type to filter the data
    customer_type = st.sidebar.radio("Customer Type", ('All', 'Member', 'Normal'))

    # Apply filters based on user input from the sidebar widgets
    filtered_data = data[data['Rating'] >= min_rating]
    if product_lines:
        filtered_data = filtered_data[filtered_data['Product line'].isin(product_lines)]
    if cities:
        filtered_data = filtered_data[filtered_data['City'].isin(cities)]
    if gender != 'All':
        filtered_data = filtered_data[filtered_data['Gender'] == gender]
    if customer_type != 'All':
        filtered_data = filtered_data[filtered_data['Customer type'] == customer_type]

    # Generate summary statistics using the filtered data
    updated_summary = get_summary(filtered_data)
    st.write("### Summary Statistics")  # Header for summary statistics section
    st.table(updated_summary)  # Display the summary statistics in a table format

    # Display the filtered raw data in a table format
    st.write("### Raw Data")  # Header for raw data section
    st.dataframe(filtered_data)  # Display the dataframe in the app

    # Create a plot of sales over time using the filtered data
    st.write("### Sales Over Time")  # Header for sales over time plot section
    plt = plot_sales_over_time(filtered_data)  # Generate the plot using a function from backend.py
    st.pyplot(plt)  # Display the plot in the app

# Python script entry point
if __name__ == '__main__':
    main()  # Call the main function when the script is executed

