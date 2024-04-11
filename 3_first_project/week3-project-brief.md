## Introduction

Welcome to the end of Module 1 Project! You will apply all of the skills and knowledge you have accumulated throughout the module in this project. As a result, you will be expected to showcase you skills in:

- Python (Data Types, Data Structures, Functions, Flow Control, Error Handling, List, Dict, Set Comprehension, Lambda Functions, Object Oriented Programming)
- Data Wrangling, Cleaning & Manipulation
- Data Structuring & Combining
- Basic Exploratory Data Analysis (EDA) for insights gathering
- Web Scraping & APIs

## Setup

In this project, you will work in pairs. As you create your Kanban board for project management purposes during the project, you can decide how to best divide the work between you.

## Typical Day

In this project you will be working on the project for the majority of the day with your partner. It is up to you to plan your time and manage your tasks.

## Topics & Tasks by Day

To keep on track, the following is a recommended set of daily tasks you can refer to throughout the project:

### Day 1 (Monday)

- Look for an interesting topic and formulate some hypotheses.
- Investigate some data sources available for your chosen topic.
- Create a Kanban board for project management purposes.
- Set up a GitHub repository and practice working collaboratively on the repository.

Note: On Monday morning, there is an activity dedicated to helping you get started on the project that covers the bullet points above.

### Day 2 & 3 (Tuesday & Wednesday)

**Data Collection:**

- Identify and collect data from at least two different sources: APIs, Web Scraping or datasets. Ensure that you understand the terms of use of the API and the website you are scraping data from.
- For the API, understand the documentation, endpoints, and rate limits. Write functions to fetch data from the API, handle any rate limiting, and save the data locally if needed.
- For web scraping, inspect the website’s structure, and write a script to scrape the required data. Make sure to respect the website's **`robots.txt`** file and terms of service. Save the scraped data locally if needed.

**Data Wrangling:**

- Begin working on data wrangling.
- Examine the data and try to understand what the fields mean before proceeding with data cleaning and manipulation.
- Analyze the structure and quality of a dataset, identify potential issues or problems, and develop a plan for cleaning and transforming the data.
- Apply at least five data cleaning techniques, such as handling null values, dropping columns, removing duplicated data, manipulating strings, formatting the data, etc., to prepare the dataset for analysis.
- Structure the data to make it suitable for analysis. This can involve creating new fields, grouping data, or creating pivot tables.
- Start working on your analysis and plots.
- Use aggregation and filtering techniques to further refine the dataset and to start drawing conclusions about your hypotheses.

### Day 4 (Thursday)

- Finalize all cleaning, transformation, and analysis tasks.
- Finish doing basic EDA and use the insights gained from it to validate or disprove the initial hypotheses.
- Finish refining your code according to best practices.
- Prepare a visually appealing presentation with minimal text to effectively communicate the insights and conclusions to stakeholders. Make sure to build a compelling narrative that highlights the significance of your analysis.

### Day 5 (Friday)

- Deliver a presentation in class.
- Project & Module retrospective.

## Project Brief

You will choose a theme and gather the data by connecting to an API or scraping some data from the web. You ill also have to organize, clean and analyze the data using your data wrangling skills and present your findings in a presentation.

## Requirements

- Your project must include data from (at least) 2 different data sources (APIs, web scraping or existing datasets)
- README file with the following structure:
    - Title of the project
    - Introduction to your project.
    - Data you are using (and comments, main challenges, strengths & weaknesses, etc...)
    - Questions you want to answer (maybe divided by different topics). Each question should include a conclusion written in a markdown cell.
    - Describe the methodology you are using, explaining the steps you took for data cleaning, analysis, etc.
    - Conclusions after your analysis.
    - Further questions.
    - Links to data sources and Trello.

## Coding Best practices

Remember to **clean your code daily according to best practices**:

- **Modularize Code**: Create reusable functions and classes, and place them in separate `.py` files. Import them into your notebooks or main scripts to maintain a clean and organized codebase.
    - Use a "main cleaning function" in "cleaning.py" (or similar) that calls all the smaller cleaning functions in a specific order to perform the entire cleaning process at once.
- **Naming Conventions**: Use clear and descriptive names for variables, functions, and classes. Follow language-specific naming conventions to enhance readability.
- **Remove Unused Code**: Eliminate any unused imports, variables, or lines of code. Keep the codebase clean and focused on what is necessary.
- **Comments and Documentation**: Add meaningful comments and documentation to explain complex or crucial parts of the code. It aids understanding and future maintenance.
- **Logical Organization**: Group related functionalities together and maintain a coherent flow within your scripts or notebooks.
- **Regular Refactoring**: Review and refactor the code periodically to remove redundancies, enhance efficiency, and ensure alignment with current best practices and project needs.
- **Respectful Data Collection:** Adhering to the terms of use of APIs and websites.

## Deliverables

You must submit the following deliverables in order for the project to be deemed complete:

- A new repository with the name data-wrangling-project on your GitHub account.
    - A **working code** that **meets all technical requirements**, **built by you**.
        - At least 1 Jupyter notebook is required
        - Include your functions in .py files
    - Additional needed files for your work
    - A **README with the completed project documentation**.
    - The URL of the **slides for your project presentation**.
- Presentation: When presenting your work, there are many important factors to consider, such as the content of your presentation and the way you deliver it.
    - Remember to allow time to rehearse the presentation beforehand.
    - See the “Presentation” section below for guidelines.
- Paste your own repository’s link in the Student Portal Project Activity.
    - Note: Each student should have their own repository to submit.
- Links to the data you are using (sources) and your Kanban board (Trello) in the README.

## Rubric

In order to assess your project and ensure all requirements are met, a **rubric** will be used. This rubric is used to **evaluate your project** by your teaching staff but also to **communicate** what constitutes incomplete, acceptable and excellent performance across each of the learning outcomes for the project. Take some time to review the rubric that is in the Student Portal and ask your teacher any questions about it if necessary.

## The Presentation

You will present your project on Friday morning to the class showcasing your project as well as a short presentation in the form of some slides. You should present your findings to the class in a visually appealing, easily understandable manner. The format of the presentation will be as follows:

- Talking with Slides: **5 minutes**
- Demo: **5 minutes**
- Total: **10 minutes**

All presentations will be done **from a staff member’s computer**, so **your slides need to be online**. PowerPoint files, Keynote files or files of any kind **will not be accepted**.

- Suggested online slide applications:
    - **[Google Slides](https://www.google.com/slides/about/)**
    - **[Slides](https://slides.com/)**
    - **[Prezi](https://prezi.com/)**

### Presentation Structure

Feel free to present the project in as you feel best represents your work, but below you will find a suggested format for the presentation as a guide.

1. **Title Slide** (1 slide): Your project’s name and your names.
2. **Project Overview** (1-2 slides):
    - Which topic did you choose and why?
    - Briefly describe the original dataset and the hypothesis you formulated.
    - Explain the structure and process of your data cleaning and analysis.
    - Highlight any unique data cleaning techniques or methods you've employed.
3. **Data Wrangling and Cleaning** (1-2 slides):
    - Discuss the significant data cleaning challenges you encountered (missing data, duplicates, formatting issues, etc.).
    - Explain how you used APIs and web scraping to collect and enrich your dataset.
    - Explain how you resolved these challenges.
4. **Exploratory Data Analysis** (1-2 slides):
    - Discuss the exploratory data analysis methods you used.
    - Share insights and interesting patterns you found.
5. **Teamwork & Project Management** (1 slide)
    - Did you follow your workflow plan or did you add something after starting the project?
    - What worked well in your teamwork and what could be improved?
    - Did you think about the risk management?
6. **Major Obstacle** (1-2 slides):
    - Discuss the biggest obstacle or mistake you encountered during this project.
    - Share what you learned from it and how it influenced your project.
    - Is there anything you would do differently in hindsight?
7. **Conclusion and Insights** (2-3 slides):
    - Discuss whether your initial hypothesis was supported or refuted.
    - Share main learnings and any surprising insights or findings.
    - Discuss potential implications of your findings.
    - Where there any questions you couldn’t answer?
8. **Closing Slide** (1 slide): Your project’s name, your names, and a "Thank You" message.
9. **Total**: ~10-12 slides.

## Resources

**Datasets ideas**

- [Kaggle Datasets](https://www.kaggle.com/datasets)

**APIs lists**

- [AnyAPI](https://any-api.com/)
- [Top 50 Most Popular APIs on RapidAPI](https://blog.rapidapi.com/most-popular-apis/)
- [18 Fun APIs For Your Next Project](https://medium.com/@vicbergquist/18-fun-apis-for-your-next-project-8008841c7be9)

**Some API Ideas**

- [WeatherBit](https://www.weatherbit.io/api)
- [Strava](https://developers.strava.com/docs/reference/)
- [GitHub](https://developer.github.com/v3/)
- [Twitter](https://developer.twitter.com/en/docs.html)
- [LastFM](https://www.last.fm/api)
- [Spotify](https://developer.spotify.com/documentation/web-api/reference/)
- [NYTimes](https://web.archive.org/web/20150325135221/http://developer.nytimes.com/docs/times_newswire_api/)
- [News](https://newsapi.org/docs)
- [Reddit](https://github.com/reddit-archive/reddit/wiki/API)
- [Medium](https://github.com/Medium/medium-api-docs)
- [Twitch](https://dev.twitch.tv/docs/api/reference)
- [IGDB](https://api-docs.igdb.com/)
- [OMDB](http://www.omdbapi.com/)
- [GIPHY](https://developers.giphy.com/docs/)
- [StackExchange](https://api.stackexchange.com/docs)
- [YouTube](https://developers.google.com/youtube/v3/docs/)
- [TheSportsDB](https://github.com/enen92/script.module.thesportsdb)
- [NBA API](https://pypi.org/project/nba-api/)
