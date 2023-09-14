<!-- ![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Git & GitHub | Remote Repositories - forking & cloning -->

## Learning goals

After this lesson, you will be able to:

- *Fork* a remote repository on GitHub,
- *Clone* a remote repository to your local machine,
- Create a *pull request* to submit changes to a remote repository that doesn't belong to you.

<br>

## Introduction

GitHub is a platform that helps developers store, manage and track changes made in their source code and projects using Git. GitHub provides special features and tools that help developers submit, review and track changes in code. These features and tools make it easier for developers to collaborate on projects.

In this lesson, we'll show you a few features related to working together and using GitHub to track changes in code. You'll also get a chance to try them out by playing with a remote repository.

<br>

## Forking

### What is Forking?

<br>

:::success
**Forking a repository means taking someone else’s repository with code and creating your copy of it.** 
:::

<br>

Here are a couple of things to keep in mind:

- Everything related to *forking* happens online on GitHub.
- Remote repositories live on GitHub, so with forking, you are making a copy of someone’s repository hosted on GitHub. When you fork a repository, the copy (called fork) gets saved on your GitHub profile.

<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_805f8fefe6d70684ee1cdc7fb6add29f.gif)

<br>

Sounds like plagiarism, huh? Not really. There are a few different scenarios where this is fine:

- **Open Source Contributions** - Most public GitHub repos are open for you to contribute to. Whether it is [express.js](https://github.com/expressjs/express) or [jQuery](https://github.com/jquery/jquery), they openly welcome contributions. The only method to do this efficiently is by forking their repositories.
- **Creating a new project** - Sometimes, you or a group of people may not like how an open-source project is being run. If the project is open-sourced and properly licensed, then you can fork the project and run your own version. Check out this list of [forked software projects](https://en.wikipedia.org/wiki/List_of_software_forks).
- **Submitting work here at Ironhack** - We have a central repo of all the exercises you will be working on during the course. To submit your work on any exercise during the course, you must first make a fork of the exercise repo.

<br>

### How to Fork

Forking a repository is super simple. To do this, we'll navigate to [Ironhack’s GitHub practice](https://github.com/ironhack-labs/lab-github-practice) repo. 

To make a copy of this repository on your GitHub profile, click the **Fork** button in the upper-right corner of the page:

<br>

![git-fork](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-fork.png)

<hr>


In the following dialog, **choose your account** as the place to fork and **click** the **Create fork** button:

<br>

![](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/git-fork-repository.png)

<hr>

<br>

You should now have a fork (copy) of the original repository on your GitHub account.
The question now is, **how do we get this repo to our local machine**?

The answer is **cloning**.

<br>

## Cloning

### What is Cloning?

<br>

:::success
**Cloning a repository means taking a remote repository that lives on GitHub and downloading it to your local machine**.
:::

<br>

This is usually done for the following reasons:

- You have created a fork of a project and now you need to copy it to your computer so you can make some changes locally.
- You are collaborating on a project where someone has invited you to their repo as a *contributor*, such as a private repo at a company, so you need to copy it to your computer and start making changes locally.

<br>

### How to Clone

Now that we have forked our own version of the exercise repo, we need to copy it to our computer so we can work on it.

**Step 1: Clone the repository to your local machine**

To clone the repository to your local machine, which is the other name for download, click the **Code** button and copy the link to your clipboard:

<br>

![git-clone-copy-url](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-clone-copy-url.png)

<br>

**Step 2: Open the destination folder** 

Open your terminal and navigate to the folder on your computer where you want to clone (download) the repo. For example, we could open the Desktop:

```shell
# Navigate to the root folder
cd ~

# Then, navigate to the Desktop folder
cd Desktop
```

<br>

**Step 3: Clone the repository using the command `git clone`.**

To clone the repository, we'll use the command `git clone` and the link we copied previously:

```shell
git clone https://github.com/sandrabosk/lab-github-practice.git
```

This will make a copy of the repository in the existing folder. We can verify it by using the `ls` command:

```shell
ls
```

<br>

:::warning
At this moment, you could be asked to enter your GitHub username and password to be able to clone the repository. This being said, you would be presented with something along these lines:

```shell
git clone https://github.com/sandrabosk/lab-github-practice.git

# Username: your_username
# Password: your_token
```

<br>

If you carefully read the previous lesson about "GitHub Basics" and if you followed the steps to create the **Personal Access Token**, you would enter the token instead the password (you should copy the token and paste it to the password field).

If you missed doing this step and don't have the token, please refer to the lesson "GitHub Basics" and find the paragraphs explaining how to **Create a Personal Access Token** and **Using a token on the command line**.

Follow the steps given there and when you have created a token, make sure to save it and then use it to proceed with the cloning process.

If nothing of the above happened, then the last case scenario is that you are presented with a warning in your terminal:

```shell
# remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
# remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
# fatal: unable to access "..." : The requested URL returned error: 403
```

<br>

If this happens, you missed completing the Personal Access Token setup, so go ahead and create the token (refer to the steps provided in the "GitHub Basics" lesson) and complete the setup. 

If you are still getting the warning and you are not prompted to enter your username and password, open up the keychain to replace your old password with the token. This step is also described in detail in the "GitHub Basics" lesson so if you are unsure how to do it, check out the guidelines provided there.
:::

<br>

**Step 4: Open the cloned repository in the VSCode** 

Now that the repository is cloned and downloaded on our local machine, we can open the folder and start working with the code. We'll open it in the VS Code using the Terminal:

```shell
# 1. Change the directory and move to the repository folder: 
cd lab-github-practice

# 2. Open the repository folder with VS Code:
code .
```

<br>

### Cloned repository and the original remote repo

A *cloned repository* already has a Git repo in it.  You do not need to run `git init`.
In addition to this, the **cloned repository is linked to the original remote repository** on GitHub from which it was cloned.

<br>

## Pull Requests

### What is a Pull Request?

:::success
**A Pull Request** is a way of **notifying the repository owner that you have made some changes and would like to *merge* them** into their repository at the owner’s discretion.
:::

<br>

In your professional ventures, open-source projects and even later in the course, when you collaborate on group exercises, it can be *very tricky* to manage which changes are made, how they are made and avoid conflicts when merging changes in the source code.

Pull Requests were created specifically to solve this.  With Pull Request, you can submit the updated code for review and ask that it be added to the original code base, the original repository.

<br>

### How to make Pull Request

Before creating a Pull Request and submitting the updated code, let's make some changes to the code and commit them.

<br>

**Step 1: Make changes to the code locally**

We'll update the `index.html` file available in the repository we cloned to our local machine. We'll update it in the following way:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Portfolio Page</title>
</head>
<body>
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>

  <h1>Welcome To Ironhacker's Page</h1>

  <section>
    <h2>Things I Don't Like</h2>
    <ul>
      <li>Fish</li>
      <li>Heights</li>
      <li>Wind</li>
    </ul>
  </section>
</body>
</html>
```

<br>

**Step 2: Make a snapshot of changes by making a *commit***

Next, we'll make a snapshot (a **commit**) of changes that we made and save them by making a `git commit`:

```shell
# 1. Check the changes made:
git status

# 2. Stage all the changes for the commit (Move to the staging area, for the next commit):
git add .

# 3. Check the changes made once more. Staged changes ready to commit should be green:
git status

# 4. Create a commit - this will make a snapshot of all the staged files (in green):
git commit -m "Add things I like"
```

<br>

**Step 3: Push the new commit containing changes to the original remote repo**

To be able to make a Pull Request and submit our updated code, we first have to push the changes to the repository on GitHub:

```shell
git push origin master
```

<br>

If this succeeded, you will be able to see the commit message you created (image 1) and the changes in the file you made (click on the commit message to see the view as on image 2 below) :

<br>

![git-push-to-fork](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-push-to-fork.png)

<br>

![git-push-to-fork-details-view](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-push-to-fork-details-view.png)

<hr>


<br>

Now you are ready to move on to making the Pull Request.

<br>


**Step 4: Open the repository on GitHub**

To create a Pull Request, open your fork (copy) of the repository on GitHub. Once there, click on the **Pull Request** button.

![](https://i.imgur.com/K08m46s.png)

<br>



**Step 2: Click the "New pull request" button** 

On the next screen, click on the **New pull request** button:

![](https://i.imgur.com/zlr5K5n.png)

<br>



**Step 3: Check the base repository**

Before creating a pull request, we should always double-check the destination repository for our Pull Request. The destination is, by default, set to the original repository. 
So far, you don't have to do anything about this, but we want you to be aware of it.
Next, click on the **Create pull request** button:

![](https://i.imgur.com/kAZyW3U.png)

<br>

**Step 4: Create a Pull Request**

The last step is specifying the *title of the Pull request* and an optional *comment* explaining the changes in code we want to submit. 
In the Pull Request title input, write your name and the message "Practice making a fork, clone and a Pull Request".
Once done, click on the **Create pull request** button to create the Pull Request:

![](https://i.imgur.com/P3F0rln.png)

<br>

Congratulations! You've just made your first Pull Request.  :tada:

<br>

## Quick Reference

Here are the most important commands you have learned in this lesson:

**Cloning a project**

```shell
git clone <repository-url>
```

<br>

**Make a snapshot of changes by making a *commit***

```shell
# Stage all the changes for the commit:
git add .

# Check the status after staging the changes:
git status

# Create a commit - this will make a snapshot of all the staged files (in green):
git commit -m "Your commit message"
```

<br>

**Push commits to the remote (GitHub) repo**

To be able to make a Pull Request and submit our updated code, we first have to push the changes to the repository on GitHub:

```shell
git push origin master
```

<br>

***Note:*** You don’t have to fork someone’s repository to be able to clone it - these two are completely independent commands. You will have to *fork* first only if you are expected to submit/show changes via a Pull Request. 

In any other case, you can click on the `Clone` or `Download` button and grab the link and in your terminal run:

```shell
git clone <the-url-of-project-you-want-to-clone>
```

<br>

## Summary

In this lesson, we discussed collaboration on GitHub:
- **Forking** a repository - creating a copy of a remote repository on your GitHub,
- **Cloning** a repository - downloading a remote git repository to your machine using **`git clone`**.
- **Merging** the changes you made locally on your computer and pushed on your GitHub into the forked repo with the original repo using a **pull request**.

Collaboration is one of GitHub’s primary purposes. Using the tools that we have highlighted in this lesson, you can do so many things, among which are submitting work at Ironhack and working on a dev team in the real world.

<br>

## Extra resources

- [The difference between forking and cloning a repository](https://github.community/t5/Support-Protips/The-difference-between-forking-and-cloning-a-repository/ba-p/1372)
