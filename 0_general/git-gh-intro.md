<!-- ![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Git & GitHub | Introduction -->

## Learning goals

After this lesson, you will be able to:

- Describe what a Distributed Version Control System (DVCS) is and why it is important,
- Explain what Git is and why it is used,
- Explain what GitHub is and why it is used,
- Explain the difference between Git and GitHub.

## Introduction

In this lesson, you'll learn how Git and GitHub are used for version control and how they relate to Distributed Version Control Systems (DVCS). 

Before we dive in, take a moment minutes to watch the following short video that introduces Git and GitHub and their role in version control:



<!-- {%youtube uUuTYDg9XoI %} -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/uUuTYDg9XoI" title="What is Git and GitHub?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br>

##  Distributed Version Control System (DVCS)

<br>

:::info
A **Distributed Version Control System (DVCS)** or a **Version Control System (VCS)** is a tool that records file changes over time, allowing you to retrieve specific versions of changed files at any time. It helps to manage and track changes to your code.
:::

<br>

A Distributed Version Control System (DVCS) is commonly used with a **Code Hosting Platform**, such as GitHub, to store and share project code among team members. This is useful when multiple people are working on a project or when you need to easily share the code or revert to an earlier file version.

<br>

<img src="https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_63ec103d558b61976562fec9763aba4d.png" style="display: block; margin: 0 auto; width: 400px; margin-bottom: 50px;">

<br>

When many developers work on the same project, keeping track of all the changes can be hard. A Distributed Version Control System (DVCS) helps to coordinate the changes and ensures everyone is working with the most up-to-date code.

For example, imagine you and a classmate working on a bootcamp project. Typically, you would start by working on different parts of the project at the same time on your local computers. But how do you combine your work saved on different computers? 

This is where a DVCS like Git comes in; it allows you to track changes, share your code, compare your work and eventually combine everything into a final version.

<br>

### Benefits of Using DVCS

- **Version control:** Having different versions of the same file gives you more control over your code. If something goes wrong with the latest version of the code, you can recover an older, correct version.
- **Improves team collaboration:** DVCS is beneficial when working with multiple developers on a project. It allows you to to combine changes and resolve conflicts that may arise when multiple developers make changes to the same file or project.
- **Backup and recovery:** The DVCS's distributed model allows code to be stored in multiple locations, such as local machines and code hosting platforms like GitHub. As a result, this makes it an effective tool for storing work safely, recovering work and having code backups.

<br>

## What is Git?

<br>

<img src="https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_94d7762076588ec19ea92e8497cf3b0d.png" style="display: block; margin: 0 auto; width: 300px; margin-top: 20px; margin-bottom: 30px;">

<br>

**[Git](https://git-scm.com/) is a** free and open-source **Distributed Version Control System (DVCS)** designed to handle computer programming projects with speed and efficiency. It is easy to learn and has a very high performance.

<br>

:::info
**Git runs locally**. What does it mean? When you use Git, it **runs on your local computer**. This means you have a Version Control System installed on your laptop, allowing you to manage and track your code locally using version control.
:::

<br>

## What is GitHub?

<br>

<img src="https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_ffd7f69f32937d26b908851f0aaaac60.png" style="display: block; margin: 0 auto; width: 300px; margin-top: 20px; margin-bottom: 30px;">

<br>

:::info
**[GitHub](https://github.com/)** is a **code hosting platform** for version **control and collaboration**. It allows you to store your code in a central location - online, making it easy for you and your team to access and collaborate on it from anywhere in the world.
:::

<br>

GitHub is a code hosting platform that works  with Git to manage and store your code repositories online.

GitHub provides a variety of features that enable users to collaborate on projects, including:

- Version control
- Creating different branches,
- Forking repositories,
- Creating pull requests,
- Reviewing other people's projects or code,
- Commenting on other people's code.

*These concepts and features may seem unfamiliar now, but we'll explore each of them step-by-step throughout the course so that you can learn how they work and how to use them to manage your code.*

<br>

## Relationship between Git and GitHub

Git and GitHub are related, but they serve different purposes.

<br>

:::info
**Git** is a **Version Control System** that enables you to manage your code locally **on your laptop**. 
:::

<br>

:::info
**GitHub** is an **online platform for hosting and sharing code** that makes it easy to collaborate with others.
:::

<br>

### How do Git and GitHub work together?

In a project development environment, Git and GitHub work together to facilitate collaboration on code. Developers can make changes to the code on their local machines and save those changes locally by making a "commit," which creates a snapshot of the code at that specific point in time. 

Once developers are ready to share their changes (updated files) with others, they can "push" them to GitHub, making them available to other team members.

Other developers can then "pull" the changes from GitHub, merging them with their local code. This allows for efficient collaboration on the same codebase, ensuring that everyone is working with the most up-to-date version of the code.

Here is an explanation of the key terms that we mentioned above:

- **Commit:** A commit is a snapshot of the code at a specific point in time that you create when working with Git. It's similar to saving your progress in a video game so that you can pick up where you left off if something goes wrong.
- **Push:** Pushing code means sending the committed changes from a developer's local machine to the online repository on GitHub. This makes the changes available to other team members.
- **Pull:** Pulling code means downloading the committed changes from the online repository on GitHub to a developer's local machine. This allows the developer to keep their local copy of the code up-to-date with the latest changes made by others.

<hr>

<br>

Check out the diagram below to see how two developers, Mary and Bob, would typically collaborate on a file using Git. Here are the steps they follow:

- Mary creates a new file
- Mary saves the changes by making a commit
- Mary pushes the new file to GitHub,
- Bob pulls the file from Github,
- Bob makes some changes to the file locally,
- Bob saves the changes by making a commit,
- Bob pushes the file back to GitHub to share the changes with Mary.

<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_3a5c4dacbd59302f132a8e6b0534464f.png)

<br>

Let's break down the above diagram into simple steps to understand how two developers can collaborate on a project:

<br>

:one: **Make a change**

First, Mary creates a file called `file.txt`, adds some content to it and saves the changes. At this point, neither Git nor GitHub are involved yet.

<br>

:two: **Save/Commit the change with Git**

Mary **commits the file to Git**, which creates version 1 (v1).

**Once the file is added and committed into Git, Git generates the first version of the file**.

<br>

:three: **Push/Pull changes to/from GitHub**

Mary **pushes** the file **to GitHub** and Bob **pulls** it **to his local machine**.

By doing this, Mary allows her teammate, Bob, to get this file and make some changes to it.

When Bob pulls the changes from GitHub, two things happen:

- The `file.txt` is added to Bob's Git repository on his local machine.
- Automatically, a version of the file (v1) also appears *locally* in Bob's project.

<br>

:four: **Update the file**

Next, Bob changes the content and commits the file to his Git repository. 
When Bob commits the file changes to his Git repository, Git creates version 2 (_v2_) of the file.

<br>

:::info
**Current Status**

<br>

At this stage, Mary has **version 1** of the file, while Bob has **version 2** of that same file.
:::

<br>

:five: **Push/pull changes to/from Github**

This time Bob **pushes** the file **to GitHub** and Mary **pulls** it **to her local machine**.

When Mary pulls the changes from GitHub, the `file.txt` (v2) is added to Mary's project *locally*.

Again, this means that the file version will be added to her Git local repository and the file in her project will be automatically updated.

<br>

:white_check_mark: **Controlling Versions**

Now both developers have the latest version (v2) of the file in their Git repositories and the project folder, allowing them to access all versions and see the changes made by each other. This means they can always go back and look at either version 1 or 2 to see who made what changes and what was added or removed.

<br>

## Summary

In this lesson, we have learned the following:

- What a Distributed Version Control System is,
- What are Git and GitHub,
- Relationship between Git and GitHub and
- How two developers can collaborate by using Git and GitHub as a team.

<br>

## Extra resources

- [What is VCS? - Git Basics](https://www.youtube.com/watch?v=8oRjP8yj2Wo)
- [Git vs. GitHub: What's the difference? - IBM](https://www.youtube.com/watch?v=wpISo9TNjfU)
