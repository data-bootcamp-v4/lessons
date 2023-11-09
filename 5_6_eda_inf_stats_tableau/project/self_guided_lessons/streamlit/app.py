# app.py

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
