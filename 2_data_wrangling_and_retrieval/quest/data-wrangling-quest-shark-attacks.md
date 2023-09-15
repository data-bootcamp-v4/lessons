## Overview

Welcome to the Data Wrangling Quest! Your mission: to clean a messy data set known as “[Shark Attacks](https://www.sharkattackfile.net/incidentlog.htm)” through using data wrangling techniques. By doing so you will be able to prepare the data set for analysis for a use case of your choice. During this quest, you’ll advance your Python skills, take the next steps to becoming a data analyst, enhance teamwork, and develop your problem-solving skills. Ready? Let's go!

## Setup

### Team Roles

You'll work on the quest in a team of four, split into two pairs: the **Dev Team** and the **Research Team**.

**Dev Team:** Responsible for the quest's coding such as carrying out the necessary data wrangling, cleaning and exploratory data analysis techniques. Pair programming is strongly encouraged to allow collaborative problem-solving, exchange of ideas, and ensure quality in your code.

**Research Team:** This team is responsible for researching topics that are relevant to the project and then sharing that information with the Dev team. They will also apply the findings to the project, so each team has hands-on experience each day.

Note: Roles will **rotate daily** for skill diversification.

## Typical Day

Each day the Dev team and Research team have different responsibilities in order to meet the requirements of the quest. With the exception of day 1, where you will have some time allocated to read the project brief in full (this page) each day should be structured like this:

### Collaborative Development & Research Hour (pairs) | 15:00 - 16:00

- **Dev Team:** Implements daily topic-related code into the game.
- **Research Team:** Carries out topic-specific research.

### Interactive Knowledge Exchange (full group) | 16:00 - 16:30

- **Dev Team:** Shares coding progress and challenges with Research team.
- **Research Team:** Shares research findings and key takeaways with Dev team.

### Application & Testing Phase (full group) | 16:30 - 17:30

- **Research Team:** Applies research findings to the project.
- **Dev Team:** Supports Research team, tests changes and ensures seamless code integration.

# Quest Brief

You will initially examine the [Shark Attack dataset](https://www.sharkattackfile.net/incidentlog.htm), understanding its structure and formulating a hypothesis or several hypotheses about the data. For example, you might hypothesize that shark attacks are more common in certain geographical locations, or among individuals engaging in particular activities.

If you want to go further, you could even define a Business Case, such as “As a company that sells diving trips, I want to suggest destination for shark spotting”, or “ As a company that sells surf experiences or surf boards, I want to know where to set up a new shop and avoid shark attacks”.

Throughout the project, you'll utilize Python programming and the pandas library to implement at least five data cleaning techniques to handle issues such as missing values, duplicates, and formatting inconsistencies. Once the dataset is cleaned, you'll use basic exploratory data analysis to validate your initial hypotheses and extract meaningful insights.

## Topics by Day

Each day teams focus on different topics. These topics dictate the Dev Team's coding and Research Team's research activities. Instructions for each day are provided below. Remember, these are **suggested** paths; you can manage your team as long as the requirements of the quest are met.

### Day 1

**Dev Team Key Tasks & Topics:**

- Download the dataset and import it into Python.
- Examine the data and try to understand what the fields mean before proceeding with data cleaning and manipulation.
- Analyze the structure and quality of a dataset, identify potential issues or problems, and develop a plan for cleaning and transforming the data.

**Research Team Key Tasks & Topics:**

- Read self-guided material on business problems, opportunities, problem statements & hypotheses. Also read the self-guided lesson on the MVP (minimum viable product) mindset, scoping and roadmap creation.
- Share your findings with the Dev Team and decide on a hypothesis (or hypotheses) to guide your data cleaning efforts.
    - Think about how to present the analysis clearly and coherently to support the findings.
    - For example: "Sharks attack more younger people than older," "The easiest way to get attacked by a shark is by surfing," "Sharks attack more people in the USA than in Iceland," etc.
    - Define a roadmap for the quest. The deadline for the quest is on Friday, so it is recommended to divide your cleaning efforts by day. Don’t forget to leave enough time to do basic EDA, clean your code and prepare a presentation. Reviewing the topics by day might help you define the roadmap.

### **Day 2**

**Dev Team Key Tasks & Topics:**

- Clean & format everything but dates.
- Apply at least five data cleaning techniques, such as handling null values, dropping columns, removing duplicated data, manipulating strings, formatting the data, etc., to prepare the dataset for analysis.

**Research Team Key Tasks & Topics:**

- Read the self-guided material on Regular Expressions (Regex) in Python if you haven't done so before. Explore how Regex can be utilized to extract or manipulate strings in a dataset.
- Research on the patterns which might be relevant for this particular dataset (like patterns in location names, activity descriptions, etc.).
- Read the self-guided material on Dates in Python. Explore how manipulate dates in a dataset.
- Share your findings with the Dev team. Apply Regex in the data cleaning process. If you need the date for your analysis, apply the appropriate techniques to the dataset.

### **Day 3**

**Dev Team Key Tasks & Topics:**

- Finish cleaning and formatting the data.
- Structure the data to make it suitable for analysis. This can involve creating new fields, grouping data, or creating pivot tables.
- Use aggregation and filtering techniques to further refine the dataset and to start drawing conclusions about your hypotheses.

**Research Team Key Tasks & Topics:**

- Read the self-guided material on Exploratory Data Analysis (EDA), focusing on the use of statistical measures, and various types of visualizations (histograms, box plots, scatter plots, etc.) to start understanding the trends and patterns in the data and support your findings.
- Understand how these techniques can help validate hypotheses and provide insights into the dataset.
- Share findings with the Dev team, decide and incorporate basic EDA methods and visualization tools (such as graphs) into the project.

### **Day 4**

On the last day of the quest, you will divide the remaining tasks however you prefer as a team.

**Dev Team & Research Team Key Tasks & Topics:**

- Finalize all cleaning, transformation, and analysis tasks.
- Finish doing EDA and use the insights gained from it to validate or disprove the initial hypotheses.
- Finish refining your code according to best practices.
- Prepare a visually appealing presentation with minimal text to effectively communicate the insights and conclusions to stakeholders. Make sure to build a compelling narrative that highlights the significance of your analysis.

## Team Collaboration & Guidelines

For this project, you will be using Google Colab for collaborative work. It's user-friendly, perfect for team projects, and lets you focus on Python concepts. As you progress through the bootcamp, you'll transition to Jupyter Notebooks and GitHub, which are standard in the industry. Some Google Colab tips to get started are:

- **Communication:** Keep your team informed about changes.
- **Working on the Same Cell:** Avoid simultaneous cell editing.
- **Saving Your Work:** Save your work manually frequently.
- **Refreshing:** Refresh your browser if changes aren't showing.
- **Version History:** Access through `File > Revision history`.
- **Sharing:** Click `Share` to give teammates access.

## Coding Best practices

Remember to **clean your code daily according to best practices**:

- **Modularize Code**: Create reusable functions and classes, and place them in separate `.py` files. Import them into your notebooks or main scripts to maintain a clean and organized codebase.
    - Use a "main cleaning function" in "cleaning.py" (or similar) that calls all the smaller cleaning functions in a specific order to perform the entire cleaning process at once.
- **Naming Conventions**: Use clear and descriptive names for variables, functions, and classes. Follow language-specific naming conventions to enhance readability.
- **Remove Unused Code**: Eliminate any unused imports, variables, or lines of code. Keep the codebase clean and focused on what is necessary.
- **Comments and Documentation**: Add meaningful comments and documentation to explain complex or crucial parts of the code. It aids understanding and future maintenance.
- **Logical Organization**: Group related functionalities together and maintain a coherent flow within your scripts or notebooks.
- **Regular Refactoring**: Review and refactor the code periodically to remove redundancies, enhance efficiency, and ensure alignment with current best practices and project needs.

## Deliverables

You must submit the following deliverables in order for the project to be deemed complete:

- A new repository with the name data-cleaning-pandas on your GitHub account.
    - A **working code** that **meets all technical requirements**, **built by you**.
        - At least 1 Jupyter notebook is required
        - Include your functions in .py files
    - Additional needed files for your work
    - A **README with the completed project documentation**.
    - The URL of the **slides for your project presentation**.
- Presentation: When presenting your work, there are many important factors to consider, such as the content of your presentation and the
way you deliver it. See “Presentation” section below for guidelines.
- Paste your own repository’s link in the Student Portal Project Activity.
    - Note: Each student should have their own repository to submit.

## Additional Features (Optional)

If you want to go above and beyond the basics, as optional extra features, here are some ideas for improving your project. You can also find some recommended reading to get started:

1. Use advanced data cleaning techniques, when imputing missing values or handling duplicates (such as using fuzzy matching), in addition to the basic techniques.
2. Utilize more sophisticated data visualization libraries, such as  Plotly, to create interactive and informative visualizations that enhance your analysis. For example, an interactive map of shark attacks.
3. Apply regular expressions to extract insights from textual data in the dataset.
4. Explore additional questions or hypotheses beyond the minimum requirements by using APIs to combine the Shark Attack dataset with other datasets, such as weather or oceanographic data, to create a more comprehensive analysis that can uncover additional insights.
5. Anything outside of the box that can improve your analysis!

## Rubric

In order to assess your project and ensure all requirements are met, a **rubric** will be used. This rubric is used to **evaluate your project** by your teaching staff but also to **communicate** what constitutes incomplete, acceptable and excellent performance across each of the learning outcomes for the project. Take some time to review the rubric that is in Student Portal and ask your teacher any questions about it if necessary.

## The Presentation

You will present your quest on Friday morning to the class showcasing how your game works as well as a short presentation in the form of some slides. You should present your findings to the class in a visually appealing, easily understandable manner. The format of the presentation will be as follows:

- Talking with Slides: **3 minutes**
- Demo: **2 minutes**
- Total: **5 minutes**

All presentations will be done **from a staff member’s computer**, so **your slides need to be online**. PowerPoint files, Keynote files or files of any kind **will not be accepted**.

- Suggested online slide applications:
    - **[Google Slides](https://www.google.com/slides/about/)**
    - **[Slides](https://slides.com/)**
    - **[Prezi](https://prezi.com/)**

### **Presentation Structure**

Feel free to present the project in as you feel best represents your work, but below you will find a suggested format for the presentation as a guide.

1. **Title Slide** (1 slide): Your project’s name and your names.
2. **Project Overview** (1-2 slides):
    - Briefly describe the original dataset and the hypothesis you've formulated.
    - Explain the structure and process of your data cleaning and analysis.
    - Highlight any unique data cleaning techniques or methods you've employed.
3. **Data Wrangling and Cleaning** (1-2 slides):
    - Discuss the significant data cleaning challenges you encountered (missing data, duplicates, formatting issues, etc.).
    - Explain how you resolved these challenges.
4. **Exploratory Data Analysis** (1-2 slides):
    - Discuss the exploratory data analysis methods you used.
    - Share insights and interesting patterns you found.
5. **Major Obstacle** (1-2 slides):
    - Discuss the biggest obstacle or mistake you encountered during this project.
    - Share what you learned from it and how it influenced your project.
6. **Conclusion and Insights** (1-2 slides):
    - Discuss whether your initial hypothesis was supported or refuted.
    - Share any surprising insights or findings.
    - Discuss potential implications of your findings.
7. **Closing Slide** (1 slide): Your project’s name, your names, and a "Thank You" message.
8. **Total**: 7-10 slides.