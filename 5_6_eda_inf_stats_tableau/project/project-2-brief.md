## Introduction

Welcome to the Module 2 project! You will apply all of the skills and knowledge you have accumulated throughout the module as well as new things you will learn over the next two weeks. You are not expected to be able to know everything from the beginning of the project - you will learn about the following topics and apply them to your project over the next two weeks:

- EDA and Data Cleaning
- Performance Metrics
- Hypothesis testing
- Experiment Evaluation
- Tableau

## Setup

In this project you will work in pairs. Like with the projects and mini projects, you should create a [Kanban board](https://trello.com/) for project management purposes in order to decide how to best divide the work between you.

## Typical Day

In this project you will be working on the project during the afternoons with your partner. The final two days of the project you will be able to dedicate the full day to the project ahead of the presentation on the Friday of week 6.

## Project Brief

### Context

You are a newly employed data analyst in the Customer Experience (CX) team at Vanguard, the US-based investment management company. You've been thrown straight into the deep end with your first task. Before your arrival, the team launched an exciting digital experiment, and now, they're eagerly waiting to uncover the results and need your help!

### **The Digital Challenge**

The digital world is evolving, and so are Vanguard’s clients. Vanguard believed that a more intuitive and modern User Interface (UI), coupled with timely in-context prompts (cues, messages, hints, or instructions provided to users directly within the context of their current task or action), could make the online process smoother for clients. The critical question was: **Would these changes encourage more clients to complete the process?**

### **The Experiment Conducted**

:::info

Note: Review what A/B testing is [here](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/self_guided_lessons/self_guided_ab_testing.md) if you are not already aware of how it works:

- [AB Testing](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/self_guided_lessons/self_guided_ab_testing.md)

:::

An A/B test was set into motion from 3/15/2017 to 6/20/2017 by the team.

- **Control Group**: Clients interacted with Vanguard's traditional online process.
- **Test Group**: Clients experienced the new, spruced-up digital interface.

Both groups navigated through an identical process sequence: an initial page, three subsequent steps, and finally, a confirmation page signaling process completion.

The goal is to see if the new design leads to a better user experience and higher process completion rates.

## **Your Data Tools**

There are [three datasets](https://github.com/data-bootcamp-v4/lessons/tree/main/5_6_eda_inf_stats_tableau/project/files_for_project) that will guide your journey:

1. **Client Profiles ([df_final_demo](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/files_for_project/df_final_demo.txt))**: Demographics like age, gender, and account details of our clients.
2. **Digital Footprints (df_final_web_data)**: A detailed trace of client interactions online, divided into two parts: **[pt_1](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/files_for_project/df_final_web_data_pt_1.txt)** and **[pt_2](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/files_for_project/df_final_web_data_pt_2.txt)**. It's recommended to merge these two files prior to a comprehensive data analysis.
3. **Experiment Roster ([df_final_experiment_clients](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/files_for_project/df_final_experiment_clients.txt))**: A list revealing which clients were part of the grand experiment.

## Topics & Tasks by Day

Your primary objective is to decode the experiment's performance. You can find the questions and tasks the team have for you divided by day below. The division of tasks for each day is a suggestion. As long as you have the project ready with all the tasks completed by the end of week 6, you are good to go!

### Day 1 & 2 (Week 5)

**EDA & Data Cleaning**

<details>
<summary style="font-size: 16px">Dataset Exploration</summary>

Before diving deep into specific questions, it's essential to understand the nature and structure of your datasets. Use Python (with libraries like Pandas, Matplotlib, and Seaborn) for this initial data exploration. If there are Data Cleaning problems, fix them accordingly.

</details>

<br>

**Client behavior analysis**

<details>
<summary style="font-size: 16px">Client behavior analysis</summary>

Answer the following questions about demographics:

- Who are the primary clients using this online process?
- Are the primary clients younger or older, new or long-standing?

Next, carry out a client behaviour analysis to answer any additional relevant questions you think are important.

</details>

<br>

### Day 3 (Week 5)

:::info

Note: Review [this content on KPIs and Metrics](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/self_guided_lessons/self_guided_KPIs_metrics.md) before starting day 3’s tasks:

- [KPIs & Metrics](https://github.com/data-bootcamp-v4/lessons/blob/main/5_6_eda_inf_stats_tableau/project/self_guided_lessons/self_guided_KPIs_metrics.md)


:::

**Performance Metrics**

<details>
<summary style="font-size: 16px">Success Indicators</summary>

You have now been asked to discover what key performance indicators (KPIs) will determine the success of the new design? Use at least completion rate, time spent on each step and error rates. Add any KPIs you might find relevant.

- **Completion Rate**: The proportion of users who reach the final 'confirm' step.
- **Time Spent on Each Step**: The average duration users spend on each step.
- **Error Rates**: If there's a step where users go back to a previous step, it may indicate confusion or an error. You should consider moving from a later step to an earlier one as an error.

</details>

<details>
<summary style="font-size: 16px">Redesign Outcome</summary>

Based on the chosen KPIs, how does the new design's performance compare to the old one?

</details>

<br>

### Day 4 & 5 (Week 5)

**Hypothesis Testing**

As part of your analysis, you'll conduct hypothesis testing to make data-driven conclusions about the effectiveness of the redesign. See the full details below:

<details>
<summary style="font-size: 16px">Completion Rate</summary>

Given the data and KPIs you have explored discussed, one interesting hypothesis to test is related to the completion rate between the Test and Control groups. Since the new design (Test group) had a higher completion rate compared to the old design (Control group), you are required to confirm if this difference is statistically significant.

Make sure to define the proper null and an alternative hypothesis to test it. Use the provided data to test these hypotheses, and determine if you can reject the null hypothesis in favor of the alternative. Make sure to consider the significance level, p-value, the statistical test prerequisites, and other relevant statistical measures in your analysis.

</details>

<details>
<summary style="font-size: 16px">Completion Rate with a Cost-Effectiveness Threshold</summary>

The introduction of a new UI design comes with its associated costs: design, development, testing, potential training for staff, and possible short-term disruptions or adjustments for users. To justify these costs, Vanguard has determined that any new design should lead to a minimum increase in the completion rate to be deemed cost-effective.

**Threshold**: Vanguard has set this minimum increase in completion rate at **5%**. This is the rate at which the projected benefits, in terms of increased user engagement and potential revenue, are estimated to outweigh the costs of the new design.

You are required to carry out another analysis, ensuring that the observed increase in completion rate from the A/B test meets or exceeds this **5%** threshold. If the new design doesn't lead to at least this level of improvement, it may not be justifiable from a cost perspective, regardless of its statistical significance.

</details>

<details>
<summary style="font-size: 16px">Other Hypothesis Examples</summary>

You have been given the freedom to choose  another hypothesis to test. Here are some examples:

- You might want to test whether the average age of clients engaging with the new process is the same as those engaging with the old process
- You might want to test if the average client tenure (how long they've been with Vanguard) of those engaging with the new process is the same as those engaging with the old process
- You might want to test if there are gender differences that affect engaging with the new or old process

Make sure to define the proper null and alternative hypothesis to test it. You are required to choose one or come up with another of your own to test.

</details>

<br>

**Experiment Evaluation**

You are also required to carry out an evaluation of the experiment by answering questions about the design effectiveness, duration and any additional data needs. See the full details below:

<details>
<summary style="font-size: 16px">Design Effectiveness</summary>

- Was the experiment well-structured?
- Were clients randomly and equally divided between the old and new designs?
- Were there any biases?

</details>

<details>
<summary style="font-size: 16px">Duration Assessment</summary>

Was the timeframe of the experiment (from 3/15/2017 to 6/20/2017) adequate to gather meaningful data and insights?

</details>

<details>
<summary style="font-size: 16px">Additional Data Needs</summary>

What other data, if available, could enhance the analysis? 

</details>

<br>

### Day 1 & 2 (Week 6)

**Tableau**

Once you have your findings, use Tableau to create insightful and interactive visualizations.

<details>
<summary style="font-size: 16px">Tableau Tasks</summary>

- Think of metrics for our `A/B experiment`. Think about how to present visually the results of the experiment.
- Import the cleaned and processed data into Tableau. Explore the column types.
- Create a dashboard showcasing the A/B test results, including completion rates, time spent on each step, error rates for both the Test and Control groups and/or any KPIs you've defined for this business case.
- Use Tableau's filtering and drilling capabilities to allow viewers to explore data based on demographics, such as age groups or gender.
- Incorporate visualizations from the EDA section to provide context.
- Ensure your visualizations are clear, concise, and tell a compelling story about the experiment's results.

</details>

<br>

### Day 3 & 4 (Week 6)

Enhance and finalize all tasks from the previous days to create a comprehensive project presentation due this Friday. Ensure that the project is not only complete but also offers clear insights, well-defined deliverables, and is accompanied by organized and structured code. Additionally, consider addressing any optional bonus tasks that may arise or are listed in the bonus task inventory (see below).

Furthermore, please verify that you have thoroughly reviewed the self-guided lessons on the following topics:

- Streamlit
- Project setup: directories and environments

This comprehensive approach will help you showcase a polished and well-rounded project in your presentation.

## Getting Started

### **Metadata**

This comprehensive set of fields will guide your analysis, helping you unravel the intricacies of client behavior and preferences.

- **client_id**: Every client's unique ID.
- **variation**: Indicates if a client was part of the experiment.
- **visitor_id**: A unique ID for each client-device combination.
- **visit_id**: A unique ID for each web visit/session.
- **process_step**: Marks each step in the digital process.
- **date_time**: Timestamp of each web activity.
- **clnt_tenure_yr**: Represents how long the client has been with Vanguard, measured in years.
- **clnt_tenure_mnth**: Further breaks down the client's tenure with Vanguard in months.
- **clnt_age**: Indicates the age of the client.
- **gendr**: Specifies the client's gender.
- **num_accts**: Denotes the number of accounts the client holds with Vanguard.
- **bal**: Gives the total balance spread across all accounts for a particular client.
- **calls_6_mnth**: Records the number of times the client reached out over a call in the past six months.
- **logons_6_mnth**: Reflects the frequency with which the client logged onto Vanguard's platform over the last six months.

## Bonus: Additional Tasks (Optional)

If you complete all of the tasks and have some extra time before the presentation, you can explore the following additional questions and tasks:

<details>
<summary style="font-size: 16px">Client Behavior Analysis</summary>

Interaction Patterns:

- How do clients navigate through the old versus the new digital process? Do they follow similar steps or diverge at certain points?
- Consider another hypothesis. Investigate if there's a difference in the number of actions (steps) taken by users between the Test and Control groups.

</details>

<details>
<summary style="font-size: 16px">Power and Effect Size</summary>

- Calculate the effect size and post-hoc power for the first test: the new design (Test group) had a higher completion rate compared to the old design (Control group), the hypothesis test checked if this difference was statistically significant.
- Let's assume we are in the phase of designing the experiment for the same hypothesis test. Do **Power Analysis** to calculate the minimum sample size for an experiment.

</details>

<details>
<summary style="font-size: 16px">Streamlit</summary>

Add Streamlit to your project to achieve **Customization and Real-time Analysis.**

</details>

<br>

## Deliverables

You must submit the following deliverables in order for the project to be deemed complete:

- A new repository with the name `vanguard-ab-test` on your GitHub account.
    - **Working code** that **meets all technical requirements**, **built by you**.
        - At least 1 Jupyter notebook is required
        - Include your functions in .py files
    - Additional needed files for your work, such as a **Tableau** file
    - A **README with the completed project documentation**.
    - The URL of the **slides for your project presentation**.
- Presentation: When presenting your work, there are many important factors to consider, such as the content of your presentation and the way you deliver it.
    - Remember to allow time to rehearse the presentation beforehand.
    - See “Presentation” section below for guidelines.
- Paste your own repository’s link in the Student Portal Project Activity.
    - Note: Each student should have their own repository to submit.
- Links to the data you are using (sources) and your Kanban board (Trello) in the README.

## Rubric

In order to assess your project and ensure all requirements are met, a **rubric** will be used. This rubric is used to **evaluate your project** by your teaching staff but also to **communicate** what constitutes incomplete, acceptable and excellent performance across each of the learning outcomes for the project. Take some time to review the rubric that is in Student Portal and ask your teacher any questions about it if necessary.

## The **Presentation**

Once you've started to draw your conclusions, prepare to share your insights through a presentation. Imagine presenting to Vanguard's top brass in a 10 minute meeting. Remember to back your findings with data and analysis. While you have the freedom to use any advanced tool or language, the team at Vanguard is quite fond of Python and SQL.

All presentations will be done **from a staff member’s computer**, so **your slides need to be online**. PowerPoint files, Keynote files or files of any kind **will not be accepted**.

- Suggested online slide applications:
    - **[Google Slides](https://www.google.com/slides/about/)**
    - **[Slides](https://slides.com/)**
    - **[Prezi](https://prezi.com/)**

### Presentation Structure

Feel free to present the project in as you feel best represents your work, but below you will find a suggested format for the presentation as a guide.

1. **Title Slide** (1 slide):
    - Your project’s title and your team members' names.
2. **Introduction** (1 slide):
    - Briefly introduce Vanguard and the context of the digital challenge.
    - State the main question: Did the new UI lead to higher completion rates?
3. **Data Overview** (1-2 slides):
    - Present an overview of the three datasets used: Client Profiles, Digital Footprints, and Experiment Roster.
    - Outline the data cleaning and merging process you performed.
4. **Exploratory Data Analysis (EDA)** (2-3 slides):
    - Highlight the key demographics and behaviors of Vanguard’s online clients.
    - Share initial findings about client engagement before diving into the A/B test results.
5. **Performance Metrics** (2-3 slides):
    - Define the KPIs you chose to evaluate the new design’s performance.
    - Compare the KPIs for the Control Group vs. the Test Group.
    - Present visual aids to support the KPI analysis.
6. **Hypothesis Testing** (2-3 slides):
    - Discuss the hypothesis tests conducted, the chosen significance levels, and the results.
    - Include the tests for completion rate differences and cost-effectiveness threshold evaluation.
    - Present any additional hypothesis tests conducted and their outcomes.
7. **Experiment Evaluation** (1-2 slides):
    - Evaluate the experiment design, discussing the randomization, duration, and potential biases.
    - Suggest what additional data could have been beneficial.
8. **Tableau Visualizations** (2-3 slides):
    - Showcase the Tableau dashboard and visualizations created.
    - Demonstrate how viewers can interact with the data based on demographics.
9. **Teamwork & Project Management** (1 slide):
    - Reflect on how you divided and conquered the project tasks using your Kanban board.
    - Share insights about your team’s collaboration and project management strategies.
10. **Challenges & Learnings** (1-2 slides):
    - Highlight any significant challenges you faced during the analysis.
    - Discuss how you overcame them and what learnings you took away.
11. **Conclusion** (1-2 slides):
    - Summarize the key findings from your analysis.
    - State your final verdict on the new digital interface's effectiveness.
    - Offer recommendations for Vanguard based on your insights.

## Hints

Consider reviewing these hints if you need some extra pointers. It's even more impressive if you can complete the case study without these pointers!

<details>
<summary style="font-size: 16px">See hints here</summary>

## **Performance Metrics**

### **Completion Rate**

For each group (Test and Control), calculate the number of users who reached the 'confirm' step and divide it by the total number of users in that group.

- This gives us the proportion (or probability) of users completing the process.
- Mathematically, for the Test group, the completion rate is given by:
$$
\text{Completion Rate (Test)} = \frac{\text{Number of 'Test' users reaching 'confirm'}}{\text{Total 'Test' users}}
$$
- The same formula applies for the Control group. This is a direct application of probability where we determine the likelihood of an event (completion) occurring.

### **Time Spent on Each Step**

To calculate the **Time Spent on Each Step,** determine the time difference between each step for each visit and then calculate the average duration users spend on each step before moving to the next. The result will provide insights into the average time users of both the Test (new design) and Control (old design) groups spend on each of the process steps.

- For each visit calculate the time difference between consecutive steps.
- Then average these time differences for each step across all visits.
- This does not directly use probability, but averages (or means) to understand typical user behavior.

### **Error Rates KPI**

To address the **Error Rates KPI**, one approach is to identify instances where users go back to a previous step, suggesting possible confusion or an error.

Calculate the error rates by identifying these instances. Consider moving from a later step to an earlier one as an error.

- For each group, the error rate is calculated as the proportion of these "error" instances to the total number of steps taken.
- This is another application of probability, where you determine the likelihood of an error occurring.
- Mathematically, for the Test group, the error rate is given by:
    
    $$
    \text{Error Rate (Test)} = \frac{\text{Number of 'backward' steps taken by 'Test' users}}{\text{Total steps taken by 'Test' users}}
    $$
    
- The same formula applies for the Control group.

## **Hypothesis Testing**

### Completion Rate

**Hypothesis**

- **Null Hypothesis ($H_0$))**: The completion rate for the Test group (new design) is equal to the completion rate for the Control group (old design).
- **Alternative Hypothesis ($H_a$))**: The completion rate for the Test group (new design) is not equal to the completion rate for the Control group (old design).

To test this hypothesis, you will use a two-proportion z-test. This test is appropriate when comparing proportions (like completion rates) between two groups.

### Completion Rate with a **Cost-Effectiveness Threshold**

- **Null Hypothesis ($H_0$):** The completion rate for the Test group (new design) is equal to or less than the completion rate for the Control group (old design) increased by 5%.
- **Alternative Hypothesis ($H_a$):** The completion rate for the Test group (new design) is greater than the completion rate for the Control group (old design) increased by 5%.

Note: a **one-sided** two-proportion z-test is appropriate.

Given the new threshold, you will compare the completion rate of the Test group to the completion rate of the Control group increased by 5%.

</details>