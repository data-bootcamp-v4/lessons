## Overview

In this mini project you will dive into the world of SQL through creating and populating a database of your own and then extracting meaningful insights through SQL using queries and Python visualization techniques. You have the freedom to choose your own data, the sources it originates from, and the business case you wish to cater to.

## Setup

In this Mini Project you will work in pairs, and are required to organize how to divide tasks throughout the week.

## Brief

In this project, you'll start by selecting and exploring datasets of your choice from various sources like Kaggle, APIs, or through web scraping. If you choose to use more than one, ensure they complement each other for a cohesive analysis. You will then formulate hypotheses related to the datasets selected. The goal is to craft a narrative using the data. You'll sketch out an Entity-Relationship Diagram (ERD) highlighting significant data fields and relationships, then proceed to create and populate a functional database. During the process, you will carry out data wrangling to clean your datasets and prepare them for analysis. You will use SQL to run queries, derive valuable insights, and summarize your findings. To conclude, you'll visualize the derived insights using Python libraries and compile a comprehensive report, encapsulating your data story from exploration to insights.

## Daily Tasks

### Day 1: ****Project Initiation**** & Data Selection

<<<<<<< HEAD
- **Data Selection**: Begin by exploring potential datasets from a variety of sources such as CSV files (available online or in platforms like **[Kaggle](https://www.kaggle.com/datasets)**), web scraping or APIs. You may also revisit the datasets you explored in week 3. **In case you need help  finding a dataset, at the end of this brief, we've included a list of famous datasets that you could work with.**
=======
- **Data Selection**: Begin by exploring potential datasets from a variety of sources such as CSV files (available online or in platforms like **[Kaggle](https://www.kaggle.com/datasets)**), web scraping or APIs. You may also revisit the datasets you explored in week 3. 
>>>>>>> 642bacd055cb986bc2a2e0599c81c72d49c3fcc6
- **Business Framing**: Clearly articulate the business challenge you're addressing. Craft hypotheses to guide your exploration.
- **Project Planning**: Map out your project's trajectory using tools like Jira or Trello.
- **Extract**: retrieve data from various sources. Examine the data and try to understand what the fields mean before building the database.

### Day 2: Data Examination & Schema Design

- **Database Design & Creation**:
    - Engage with your data to discern the significance of each field.
    - Sketch an Entity-Relational-Model, highlighting primary keys, foreign keys, and table relationships.
    - Translate the ERD into a functional database.
        - Make sure to also define the proper data types for each column.
- **Transform:**
    - Do data wrangling to transform your dataset according to your analysis goals.
- **Load:**
    - Safely import the sanitized data into your database, upholding its structural and data integrity.

### Day 3: SQL Queries & Analysis

- **SQL Queries and Insights**: use SQL commands to derive insights.
    - Leverage functionalities like **`JOIN`**, **`GROUP BY`**, **`ORDER BY`**, **`CASE`**, and subqueries.
    - Summarize the data using **`mean`, `max`, `min`, `std`** and more.

### Day 4: Analysis and Visualization

- **Data Visualizations**: use Python libraries to create compelling visual representations of your findings.
- **Report Compilation and finalization**: Synthesize all the analysis and insights into a comprehensive report that narrates your data story.
- **Presentation**: Design a compelling presentation that encapsulates the essence of your project, challenges, insights, and outcomes (see more details below).

## Deliverables

The main deliverable is a GitHub repository with the name `sql-database`. It should contain the following:

- A [README.md](http://README.md) file in the root of the repository to document the project containing useful information about the project. Anyone that reads the README should be able to understand the project without having to look through all of the files.
- Code and files that demonstrate the data pipeline coverage of acquisition, transformation, loading, analysis, and reporting. This includes:
    - Database: The exported `.sql` file should be included with the final schema.
    - Entity relationship diagram (ERD).
    - SQL Queries: A compilation of all SQL queries used during the project.
    - Python files. Remember, when using Python the code must be put in wrapped functions.
    - At least 1 Jupyter notebook containing the report in full with visualizations.
        - The report should be comprehensive and aesthetically pleasing, that narrates the story of your data in full. The report should combine text, clean code, meaningful outputs, and engaging visualizations to convey the derived insights and conclusions effectively.
        - Make sure to modularize your work. The Jupyter notebook report **must** be distinct from the code responsible for cleaning, acquiring, processing data, etc. Feel free to use multiple Jupyter notebooks, **`.py`** or **`.sql`** modules for this.
- URL of the slides for the presentation:
    - The presentation (see guidelines below) should summarize your insights and conclusions.
    - Remember to i**nclude your ERD diagram.** You should explain it during the presentation, and defend the decisions made.

### Minimum Requirements

- **Research Objectives:**
    - Define at least two clear research questions or problem statements.
    - Analyze data effectively to address these questions, ensuring the results are presented in an understandable and coherent manner.
- **Data Acquisition:**
    - Utilize a minimum of two distinct sources for your data, such as CSV files, web scraping, or APIs.
- **Database Structure:**
    - Design a database incorporating a minimum of three tables.
    - Make sure to apply suitable primary and foreign keys and delineate the relationships between tables.
- **Data Management:**
    - Efficiently import data into your database using the right tools and methods.
    - Clean, format, restructure, and categorize the data to maintain consistency and accuracy.
- **Data Analysis:**
    - Craft at least five insightful SQL queries using fundamental clauses like GROUP BY, JOIN, and Subqueries.
- **Visualization:**
    - Produce a minimum of two compelling visualizations using tools such as Matplotlib or Seaborn.

## Advanced Features (optional)

- **Scalable Data Pipeline:**
    - Develop functions to form a complete pipeline, allowing the data model to be updated with fresh data. This should cover extraction, transformation, and loading. Ensure that your analysis can adapt to new datasets.
- **Data Quality Assurance:**
    - Implement auxiliary functions that scrutinize the database for quality issues during updates.
- **Data Integration:** Incorporate multiple data sources (at least 2). To ensure a cohesive analysis, keep the following in mind:
    - **Relevance and Complementarity**: Ensure that your chosen datasets are related and complement each other to build a rich narrative.
        - **Tip**: Initiate your project with a dataset or by scraping a website, and then find an API or another CSV file that can enhance the information from your primary source.
    - **Interconnectivity**: Your datasets should share a common ground that allows them to be interconnected, facilitating a unified analysis in your report.
        - **Tip**: Merging datasets can be a complex process. Ideally, the datasets should have at least one column with matching data to successfully create a comprehensive dataset with enriched information.
        - **Tip**: If merging proves to be too challenging, consider demonstrating the relationship between the datasets through visualizations.
- **Advanced SQL Techniques:**
    - Harness advanced SQL methodologies, such as views and window functions, to gain deeper insights from the data.
- **Interactive Visualizations:**
    - Craft a minimum of five engaging visualizations using tools like Plotly. Embed these visualizations into a dynamic dashboard utilizing platforms like Dash or Streamlit.
- **Performance Optimization:**
    - Recognize the significance of indexes in boosting database efficiency and formulate indexes to accelerate query executions.
    - Amplify database and query performance by examining query execution plans, making necessary alterations to either the database schema or the queries themselves.
- **Documentation:**
    - High level documentation explaining tables designed and focusing on update methods.

## Coding Best practices

- **Modularize Code**:
    - For Python: Create reusable functions and classes, and place them in separate `.py` files. Import them into your notebooks or main scripts to maintain a clean and organized codebase.
    - For SQL: Use a local organization for `.sql` files.
- **Naming Conventions**: Use clear and descriptive names for variables, functions, and classes. The same applies for the database, tables and columns naming. Follow language-specific naming conventions to enhance readability.
- **Remove Unused Code**: Eliminate any unused imports, variables, or lines of code/queries. Keep the codebase clean and focused on what is necessary.
- **Comments and Documentation**: Add meaningful comments and documentation to explain complex or crucial parts of the code. It aids understanding and future maintenance.
- **Logical Organization**: Group related functionalities together and maintain a coherent flow within your scripts or notebooks.
- **Regular Refactoring**: Review and refactor the code periodically to remove redundancies, enhance efficiency, and ensure alignment with current best practices and project needs.

## Rubric

In order to assess your project and ensure all requirements are met, a **rubric** will be used. This rubric is used to **evaluate your project** by your teaching staff but also to **communicate** what constitutes incomplete, acceptable and excellent performance across each of the learning outcomes for the project. Take some time to review the rubric that is in Student Portal and ask your teacher any questions about it if necessary.

## Tips & Tricks for Success

- Choose the data sources ASAP and try to stick to the plan. Don't switch halfway through the week.
- Break the project down into small steps. Many smaller, simple tasks are better than a single complicated one.
- Work through and review the lessons in class to consolidate knowledge.
- Add relevant code to your project each day to maintain progress throughout the week.
- Commit early, commit often and don’t be afraid of doing something incorrectly because you can always roll back to a previous version.
- Name your commits well so your teammates know what everyone is working on.

## The Presentation

You will present your mini project on Friday morning to the class showcasing your project as well as a short presentation in the form of some slides. You should present your findings to the class in a visually appealing, easily understandable manner. The format of the presentation will be as follows:

- Talking with Slides: 7 **minutes**
- Demo: **3 minutes**
- Total: **10 minutes**

All presentations will be done **from a staff member’s computer**, so **your slides need to be online**. PowerPoint files, Keynote files or files of any kind **will not be accepted**.

- Suggested online slide applications:
    - **[Google Slides](https://www.google.com/slides/about/)**
    - **[Slides](https://slides.com/)**
    - **[Prezi](https://prezi.com/)**

### Presentation Structure

Feel free to present the project in as you feel best represents your work, but below you will find a suggested format for the presentation as a guide.

1. **Title Slide** (1 slide):
    - Project title.
    - Team members' names.
2. **Project Overview** (1 slides):
    - Briefly describe the chosen dataset and its origin.
    - Highlight the business problem and the hypotheses that guided your approach.
3. **Data Acquisition, Enrichment, and Examination** (1 slide):
    - Highlight the primary sources of data and any complementary datasets.
    - Discuss challenges faced during the data sourcing and integration.
    - Briefly describe how the supplemental data aligns with your primary dataset.
4. **Database Design & Data Transformation** (1 slide):
    - Provide a concise visualization or description of the Entity-Relational-Model.
    - Discuss the key challenges faced during data transformation, such as inconsistencies, and how they were addressed.
5. **SQL Insights & Advanced Analysis** (1 slide):
    - Showcase one or two standout insights derived from advanced SQL queries.
    - Highlight any specific analyzes that were particularly challenging or revealing.
6. **Visualization & Key Insights** (2 slides):
    - Show some of the primary visualizations developed.
    - Discuss the major insights derived from the visualizations.
7. **Conclusions & Business Implications** (1-2 slides):
    - Reflect on the original business problem and whether your findings support or refute your initial hypotheses.
    - Discuss the potential business implications of your findings.
8. **Major Obstacle** (1 slide):
    - Discuss the biggest obstacle or mistake you encountered during this project.
    - Share what you learned from it and how it influenced your project.
9. **Closing Slide** (1 slide):
    - Reiterate the project title.
    - Team members' names.
    - A "Thank You" note or any final thoughts.

**Total**: Approximately 10 slides.
<<<<<<< HEAD

## Famous Datasets

Below is a list of 50 famous datasets suitable for your project.

| Dataset Name                        | Source URL                                                                                               | Description                                                                                          |
|-------------------------------------|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| Iris                                | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/iris)                                        | A classic dataset for pattern recognition, featuring 3 species of iris plants.                       |
| Titanic Survivor Data               | [Kaggle Titanic](https://www.kaggle.com/c/titanic)                                                       | Data about the passengers on the Titanic, useful for classification problems.                        |
| Boston Housing Dataset              | [Kaggle Boston Housing](https://www.kaggle.com/c/boston-housing)                                         | Information about the housing values in suburbs of Boston.                                           |
| FIFA World Cup Players              | [Kaggle FIFA 2018](https://www.kaggle.com/abecklas/fifa-world-cup)                                       | Player statistics from the FIFA World Cup 2018.                                                      |
| Supermarket Sales                   | [Kaggle Supermarket Sales](https://www.kaggle.com/aungpyaeap/supermarket-sales)                          | Sales data for a supermarket chain.                                                                  |
| Google Play Store Apps              | [Kaggle Google Play Store](https://www.kaggle.com/lava18/google-play-store-apps)                         | Data about apps on Google Play Store.                                                                |
| US Elections Data                   | [Harvard Dataverse US Elections](https://dataverse.harvard.edu/dataverse/uselectiondata)                  | Comprehensive data on the US elections.                                                              |
| Spotify Music Data                  | [Kaggle Spotify](https://www.kaggle.com/leonardopena/top50spotify2019)                                   | Dataset of top tracks on Spotify.                                                                    |
| World Happiness Report              | [Kaggle World Happiness](https://www.kaggle.com/unsdsn/world-happiness)                                  | Survey data about the state of global happiness.                                                     |
| Credit Card Fraud Detection         | [Kaggle Credit Card Fraud](https://www.kaggle.com/mlg-ulb/creditcardfraud)                               | Dataset for credit card fraud detection problems.                                                    |
| Wine Quality                        | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/wine+quality)                                | Physicochemical data and quality ratings of wines.                                                   |
| Zomato Bangalore Restaurants        | [Kaggle Zomato](https://www.kaggle.com/himanshupoddar/zomato-bangalore-restaurants)                      | Details about restaurants in Bangalore listed on Zomato.                                             |
| New York City Airbnb Open Data      | [Kaggle Airbnb NYC](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data)                      | Information about Airbnb listings in New York City.                                                  |
| Adult Income                        | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/adult)                                       | Predict whether income exceeds $50K/yr based on census data.                                         |
| Bank Marketing                      | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Bank+Marketing)                              | Data related to marketing campaigns of a Portuguese bank.                                            |
| Car Evaluation                      | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Car+Evaluation)                              | Evaluate the acceptability of a car based on various factors.                                        |
| Human Resources Analytics           | [Kaggle HR Analytics](https://www.kaggle.com/c/hr-analytics)                                             | Data to analyze employee turnover.                                                                   |
| Online Retail II                    | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Online+Retail+II)                            | A dataset containing all transactions occurring for an online retail company.                        |
| Bike Sharing Dataset                | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset)                        | Data about bike sharing systems from Washington DC.                                                  |
| Chess (King-Rook vs. King)          | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Chess+(King-Rook+vs.+King))                  | Chess endgame database for predicting outcomes.                                                      |
| Forest Fires                        | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Forest+Fires)                                | Predict the burned area of forest fires in Portugal.                                                 |
| Student Performance                 | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Student+Performance)                         | Factors affecting student achievements in secondary education.                                       |
| Wholesale Customers                 | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/wholesale+customers)                         | Data on clients of a wholesale distributor.                                                          |
| Yeast                               | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Yeast)                                       | Predicting protein localization sites in yeast.                                                      |
| Abalone                             | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Abalone)                                     | Predict the age of abalone from physical measurements.                                               |
| HTRU2                               | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/HTRU2)                                       | Predicting a pulsar candidate using HTRU2 dataset.                                                   |
| Ionosphere                          | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Ionosphere)                                  | Classify radar returns from the ionosphere as good or bad.                                           |
| Lenses                              | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Lenses)                                      | Predictive data about the type of lenses that should be used.                                        |
| Nursery                             | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Nursery)                                     | Nursery dataset for decision making.                                                                 |
| Page Blocks Classification          | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Page+Blocks+Classification)                  | Classify page blocks of documents as one of five classes.                                            |
| Poker Hand                          | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Poker+Hand)                                  | Predicting poker hands from a dataset of drawn cards.                                                |
| Seeds                               | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/seeds)                                       | Measurements of geometrical properties of kernels belonging to different varieties of wheat.         |
| Skin Segmentation                   | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Skin+Segmentation)                           | Skin segmentation based on RGB values.                                                               |
| Wine                                | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/wine)                                        | Chemical analysis of wines grown in the same region in Italy.                                        |
| Breast Cancer Wisconsin             | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic))       | Diagnostic data for breast cancer cases.                                                             |
| Energy Efficiency                   | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Energy+efficiency)                          | Assessing energy efficiency of buildings.                                                            |
| Handwritten Digits (Optdigits)      | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/optical+recognition+of+handwritten+digits) | Image dataset of handwritten digits for recognition.                                                 |
| Heart Disease                       | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/heart+Disease)                               | Dataset for predicting heart disease presence.                                                       |
| Image Segmentation                  | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Image+Segmentation)                         | Image data for segmentation tasks.                                                                   |
| Letter Recognition                  | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Letter+Recognition)                         | Identify letter characters from various fonts and styles.                                            |
| Magic Gamma Telescope               | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/MAGIC+Gamma+Telescope)                      | Data to simulate registration of high-energy gamma particles.                                        |
| Mushroom                            | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Mushroom)                                    | Classify mushrooms as edible or poisonous.                                                           |
| Internet Advertisements             | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Internet+Advertisements)                    | Predict whether an image is an advertisement or not.                                                 |
| Libras Movement                     | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Libras+Movement)                            | Classify movements in Libras (Brazilian sign language).                                              |
| Lymphography                        | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Lymphography)                               | Diagnostic data for lymphography patients.                                                           |
| EEG Eye State                       | [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/EEG+Eye+State)                               | EEG data to determine the eye state.                                                                 |

=======
>>>>>>> 642bacd055cb986bc2a2e0599c81c72d49c3fcc6
