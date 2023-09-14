<!-- ![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Git & GitHub | Git Basics -->

## Learning goals

After this lesson, you will be able to:

- Initialize Git in your project,
- Check the status to see what has changed,
- Add your changed files to the staging area with the `git add` command,
- Take a snapshot of changes you have made using `git commit`,
- View previous commits you have made using `git log`.
- Explain what GitHub is and what it is used for,
- Explain what a _remote repository_ is,
- Push and pull code between your _local_ and _remote_ repositories.

## Part 1: Git

## Creating a Repository

Let's start by creating a directory to play with Git. Navigate to the desktop and create a folder called _git-practice_:

```bash
# We assume you are already in the desktop folder

mkdir git-practice

cd git-practice

touch data.txt

code .
```

Add some text to `data.txt`. Feel free to change the data:

```
Name: Ironhacker
Age: 25
Favorite Color: Yellow
```



### `git init` and the hidden `.git` folder

We can use Git to keep track of changes in files and folders on your local machine, but how is this done?

**Don't assume this happens all the time since that is not the case**. To be able to track the changes you made in your file, the first thing you have to do is **to initialize this folder as a git repository**. _We will explain this._

Inside the `git-practice` folder, run the following command:

```bash
git init
```

_You should have `git` installed on your computer. You can check it out by running the following command in the terminal_:

```bash
git --version
```

_The output should be your git version, something like for example `git version 2.20.1`_. In general, it's still fine if you see other version numbers that are bigger or smaller than this one. Depending on your operating system, the version number that is compatible with your system may be slightly different. If you can run the command above and see the version number, Git is installed on your system.

:::info
`git init` is the command to signal to Git that the folder you are currently in will now be a [Git repository](https://en.wikipedia.org/wiki/Software_repository). From this point forward, Git will track all changes to the files and folders inside that folder.
:::

However, remains the same question - how does it keep track of these changes?

Let's run an `ls` command to show hidden folders and files inside of the folder:

```bash
ls -a

# => .        ..       .git     data.txt
```

<br>

:::warning
:exclamation: `# =>` denotes a return value. You do not have to type this into your terminal.
:::

<br>

In addition to data.txt, we have a new folder called `.git`. We did not create this directory ourselves - Git did when we ran the `git init` command.

**The `.git` folder is where Git keeps track of all of the changes you make and _much_ more**. There is no point in going into the specific details of the folder now. However, we will reference it as the lesson progresses.

<br>

:::info
:bulb: If for some reason you run `git init` in a folder you didn't intend to make a git repository, you can simply remove the `.git` folder using `rm -rf`:

```bash
git init # => to initialize folder as Git repository

rm -rf .git # => to remove git (tracking)
```

<br>

**Be careful, though. `rm -rf` is a dangerous command that can erase everything on your system if misused**.
:::

<br>

### Where to create a `.git` folder/ where to run `git init`?

(_We will use the naming git repo/repository, but you can see it the same as git folder/directory. Repo/repository is more common though._)

It may be easier to begin this by telling you where to **not create it** and why.

Most of the time, you will want to create the Git repository in a specific project folder.

**You do not want to create a Git repository in a high-level folder, such as `Documents`, or your home(`~`) directory.** Why? Git keeps track of the folder and _all subfolders of that folder_. This means that if you create a Git repository in your home(`~`) directory, you will be tracking all of the changes to files and folders on your local user's computer.

This is bad because:

- it is unnecessary;
- when you go to create a Git repo later on inside of a project, you may run into issues;
- when you eventually want to store your Git repos on GitHub later, you may accidentally push sensitive information. :-1:

At Ironhack, you will be creating _many_ projects and folders to track with Git. Take a look at the following tree to give you an example of where you should be creating Git repos:

```shell
├── project-1
│   ├── index.html
│   └── style.css
├── project-2
│   ├── index.html
│   └── style.css
├── project-3
│   ├── index.html
│   └── style.css
├── project-4
│   ├── index.html
│   └── style.css
└── project-5
    ├── index.html
    └── style.css
```

In this folder, we have five projects, all with an _index.html_ and _style.css_. We suggest creating your git repository **in each project**, as so:

```shell
├── project-1
│   ├── .git
│   ├── index.html
│   └── style.css
├── project-2
│   ├── .git
│   ├── index.html
│   └── style.css
├── project-3
│   ├── .git
│   ├── index.html
│   └── style.css
├── project-4
│   ├── .git
│   ├── index.html
│   └── style.css
└── project-5
    ├── .git
    ├── index.html
    └── style.css
```

<br>

:::danger
**The following are examples of how _not_ to structure the directory:**
<br>

:x:

<br>

```shell
├── .git
├── project-1
│   ├── index.html
│   └── style.css
├── project-2
│   ├── index.html
│   └── style.css
├── project-3
│   ├── index.html
│   └── style.css
├── project-4
│   ├── index.html
│   └── style.css
└── project-5
    ├── index.html
    └── style.css
```

:x:

<br>

```shell
├── .git
├── ironhack
│   ├── .DS_Store
│   ├── project-1
│   │   ├── index.html
│   │   └── style.css
│   ├── project-2
│   │   ├── index.html
│   │   └── style.css
│   ├── project-3
│   │   ├── index.html
│   │   └── style.css
│   ├── project-4
│   │   ├── index.html
│   │   └── style.css
│   └── project-5
│       ├── index.html
│       └── style.css
└── prework
    └── git-practice
        ├── .git
        └── data.txt
```

:::

<br>

## Viewing Changes: `git status`

Let's return to our `git-practice` folder. We have already run `git init` and Git is keeping track of our changes. We currently have one file in the folder - _data.txt_.

How can we tell what Git is keeping track of? The answer is a command that you will use very often while working on projects: **`git status`**.

<br>

:::success
**`git status`** tells us what files and folders are being tracked and what their current status is according to Git.
:::

<br>

```bash
git status
```

<br>

![git-status](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status.png)

<br>

Git is telling us that we should pay attention to right now is the one that says **Untracked files**. `data.txt` is _untracked_ because we have created it on our file system, but have not told Git to watch it yet.

We will return to and reference Git status as we continue the lesson, but let's figure out how to add a file for Git to track.

## Staging Changes: `git add`

### Staging a Single File

Currently, `data.txt` is on our file system, but not being tracked by Git. Files and folders in this state are referred to as our **working directory**. To track these files with Git, we must _add_ them to our _staging area_.

<br>

:::success
A staging area is a place where we have notified Git that something will be tracked.
:::

<br>

<img src="https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_258b1f574550a0838d42ae2a6f84bdd1.png" style="width: 320px; height: 450px; display: block; margin: 15px auto;">

<br>

To add a file to the staging area, let's use the `git add` command:

```bash
git add data.txt
git status
```

<br>

![git-status-2](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status-2.png)

<br>

Now instead of saying "Untracked Files", Git is telling us that `data.txt` is staged and in the section, _changes to be committed_.

We will discuss committing shortly, but for now, we can see that Git is now tracking our file.

### Staging Multiple Files

Often in projects, we will want to stage multiple files at the same time. This can be done in a few different ways.

Let's add some new files to play around with this:

```bash
touch file1.txt file2.txt file3.txt file4.txt file5.txt

git status
```

<br>

![git-status-3](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status-3.png)

<br>

Currently, `data.txt` is _staged_, but the other five files are not.

Let's stage `file1.txt` and `file2.txt`.

```bash
git add file1.txt file2.txt

git status
```

<br>

![git-status-4](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status-4.png)

<br>

On second thought, I would like to stage all of the files in my project:

```bash
git add .

git status
```

<br>

![git-status-5](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status-5.png)

<br>

Everything is staged!

### Un-staging Files - `git reset`

It looks like we actually don't want to add `file5.txt` to our staging area. We have made a mistake, so let's fix it. We can use the `git reset` command to remove a file from the staging area.

```bash
git reset file5.txt

git status
```

<br>

![git-status-6](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-status-6.png)

<br>

Now, `file5.txt` is back in our working directory and is no longer staged!



## Saving Changes: `git commit`

### What is a _Commit_?

The question you may have been asking before this point is: _staging for what?_ The answer lies in the screenshots. You have noticed files in the staging area are labeled with **"Changes to be committed"**.

A _commit_ in Git **is a snapshot of the state of the files and folders in your project, as well as the content in them**.

Your projects are going to be evolving and changing with time. As you add content and modify them, its _state_ changes. As their state changes, commits will capture that point in time.

:bulb: **State** in computer science is a term used to describe the status of an object, folder, files, etc. and its attributes or contents.

If `data.txt` contains: `"Hello"` and we modify that file to say: `"Goodbye"` the _state_ has changed.

<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_fac448c90eead6e3e84bf404b3999f85.png)

<br>

:::info
Using commits in Git will:

- help you revert mistakes to a previous working version (kind of _undo_ button thing);
- enable you to collaborate with others on your projects without colliding and
- keep track of _who_ made changes and _when_ they did it.
:::

<br>

For example, check out this sample commit log of a project's evolution:

<br>

![git-log](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-log.png)

<br>



### How to Make Commits

We can make commits using the `git commit` command. This will take any files in our staging area and create a new commit to our repository.

Let's take a look at the following diagram for some more visual insight:

<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_9e61fd9a3290806c060a20547f3ad946.jpg)

<br>

We have already added files to our staging area from our working directory and now we need to move them permanently to our repository. The state of our project will forever be frozen in that snapshot.

<br>

```shell
git commit -m "Initial commit - Create files, add data"

git status
```

<br>

:::info
:bulb: `git commit -m` means we will provide a message with our commit. This will become more useful later, but for now, note that you should leave a **detailed and descriptive message** about what you have done in that commit.

**Make a commit message in the present tense - as someone gave you a ticket on which they told you what to do**.

This is useful when you need to figure out what changes you have made in the past and when they were done.
:::

<!-- <br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_91aebe03df4e3ddd6a6a7a8542b6b2f7.png)

<br> -->

_What happened to our files?_ When we create commits, it removes the files from the staging area, because they have been committed. The only remaining file is `file5.txt`, which we did not add to the staging area.

Great. Now our files are committed and stored in Git, but how can we see commits that we have made previously and what we have done?

## Revisiting and Viewing Commits: `git log`

At some point in the future, it is likely we will want to view all of the changes to our project. Besides, we may want to revert our project to a previous snapshot.

The `git log` command is used to view commits and data about those commits. Let's give it a run and see what happens:

<!-- <br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_20d20b758cad79c613d8ac17fc3f2e5f.png)

<br> -->

Run the following to see the historical log of the commits that are made in the project:

```shell
git log
```

<br>

:::info
:bulb: Press `q` to exit the log dialog screen in your terminal.
:::

Contained in this dialog is our commit and some data about that commit. Each commit has:

- **Commit SHA**(for example: `commit 905616a7252c247f3244bf6ca00faeeba324a26f`) - You can think of this as a unique ID for each commit. This can be used in the future to revert to this commit, remove the commit, or combine multiple commits.
- **Author** - The author attribute is useful when working with teams to see who did what.
- **Date** - Date when the commit was created.
- **Message** - The message we left when making the commit. This gives us some context as to what was done at that point. **This is why it is crucial to leave detailed and descriptive commit messages**.

Let's make another commit and see how the log changes:

```bash
git add file5.txt

git commit -m "Add file5 to repo"

git log
```

Now you should see the last commit showing the message you just added - something along these lines:

<br>

![git-log-2](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-log-2.png)

<br>

Our newest commit just showed up!

:::info
:bulb: Like most Git commands, `git log` is extremely customizable in how the output can be formatted. Check out the [Advanced Git Log](https://www.atlassian.com/git/tutorials/git-log) article for more details.
:::

## Quick Reference

Here you have the most important commands - don't try to memorize them but instead keep this reference open every time you go through this process (with time and repetition you will know these by heart):

:::info
**Initialize a repository**

```bash
git init
```

**View changes in the repository**

```bash
git status
```

**Adding files**

- single file

```bash
git add <file-name>
```

- all files

```bash
git add .
```

**Committing file(s) to staging area**

```bash
git commit -m"<commit-message>"
```

**View changes history**

```bash
git log
```

:::


## Part 2: GitHub

## What is GitHub?

GitHub is a tool to collaborate with others (DVCS) using Git. In short, GitHub allows us to host our Git repositories in the cloud so that others can share them.

GitHub also has features for:

- **Managing Repos** - Team collaboration can be tricky. When multiple people are working on the same project, it is hard to find a source of truth and manage who can change the repository. GitHub has features to facilitate this.
- **Project Management** - With open source projects, it is often difficult to state the general direction of the product, transparently display which features are being implemented and the priority of those features.
- **Social Networking** - GitHub has features to search and find others, find repos with a specific language and follow/unfollow other coders.
- **Organizations and Team Management** - If you have a company or a project in which multiple people are working, you can create an _organization_, or a group of people with varying permissions and abilities on the repo.
- ...and many more.

Currently, we have a local Git repository. As it is, we can't share this repository with anyone, so let's change that.

## Creating a GitHub Repo

There are quite a few ways to create a GitHub repo, but let's talk about the simplest first. The easiest way to get up and running is to visit GitHub.

Click the plus sign in the upper right-hand corner of the page and then click "New Repository":

<br>

![github-new-repository](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/github-new-repository.png)

<br>

You will be presented with the following page. Fill in the data as it is in the screenshot:

<br>

![github-create-new-repo](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/github-create-new-repo.png)

<br>

A few things to note about this page:

- **Repository name** (_mandatory_) - This is the name of the repository as it will appear on GitHub. _This does not have to match the name of your local repository and can't have any spaces_.
- **Description** (_optional_) - Helpful for outsiders that may stumble upon your project on GitHub.
- **Public / Private** - If your repository is public, that means anybody can discover your project from Google or your profile. Real-world projects frequently will be private repos, so only those that are collaborators can view them. All your repositories during your Ironhack journeys should be public. That will allow your teacher/TAs to check your work and your future employers can see how you progressed.

Leave the rest as defaults for now and click "Create Repository". You will then be taken to a page that looks like the following:

<br>

![github-create-new-repo-2](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/github-create-new-repo-2.png)

<br>

What we will take special note of is the following section "**...or push an existing repository from the command line**", since we already have a local repo on our computers:

<br>

![github-create-new-repo-3](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/github-create-new-repo-3.png)

<br>

GitHub gives us some instructions here, but let's take a more in-depth look.

*In case you see the default branch name being different than in the screenshot, that is ok - sometimes you can see `master` and sometimes `main`. Both are in use.

## Adding a Remote Repository: `git remote`

Our remote repository and local repository are two entirely different repos. When we make changes locally, we will have to _push_ them to our remote repository - which lives on GitHub (the online cloud). When we want to grab changes that our collaborators made on their computers and pushed into the GitHub repo, we will have to _pull_ them to our local repository.

:::success
:arrow_up: - **push** => take changes made locally to a remote repo that lives on GitHub
:arrow_down: - **pull** => take changes others made on the same repo and pushed to GitHub to your local repository
:::

The first step in this is connecting the two repos. This can be done using the `git remote add` command while supplying a few options:

- **alias** - you create an alias in your system for the **remote** repository, which will be pointing to the GitHub repo. It is very common to call this alias **[`origin`](http://stackoverflow.com/questions/9529497/what-is-origin-in-git)**, which we will advise you to do all the time except now. Since this is the learning process and we want you to understand that _origin_ is a _remote_ repo hosted on GitHub, we will call it _origin_ (just for now).
- **GitHub repository URL** - a unique URL that GitHub provides for each repository.

Navigate to your `git-practice` folder on your computer if you are not already there and run the following:

```bash
git remote add origin https://github.com/your-github-username/git-practice.git

# "origin" is a shorthand name for the remote repository where we will push the changes 
# and where from we will pull the changes when our collaborators make them.
# "origin" is used instead of the original repository's URL - and thereby makes referencing much easier
```

To sum it up - we are using `origin` as an alias for our first GitHub project.

<br>

:::info
:bulb: **You can retrieve the link used in the previous code snippet to your GitHub repo here:**

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_244a3335704e057b99d686910433978a.png)

:::

<br>

This is telling your local GitHub repo: "Add a remote repository called _origin_ and have it point to `https://github.com/your-github-username/git-practice.git`".

We can view a list of remote repos attached to our current local repository by running `git remote` with no options:

```bash
git remote -v
```

<br>

![github-git-remote-origin](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/github-git-remote-origin.png)

<br>

You can have as many or as few remote links as you would like. GitHub is only one remote Git hosting service. There are others such as Bitbucket, Gitlab and many more.

<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_5a42d33001d6f29b90393f7adc87dd3a.png)

<br>

Now that our local repository and remote repository are connected via a remote, let's push some code!

<br>

## Adding changes to a remote repository: `git push`

<br>

Adding to a remote repository is pretty simple in most situations. We use the `git push` command, along with a couple of options to push our local repository to our remote repository (the first a couple of steps stay the same, you have to do: 1. `git add .`, 2. `git commit -m"some message"` and then push changes to remote repo):

```bash
# to add all the changes that are made in the repo
git add .

git commit -m "add a descriptive message"

git push origin master
```
<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_f2a5fa0599b3473665aa37a5a767ca0f.gif)

<br>

- **`git-push`** - command to push code from a local to a remote repo;
- **`origin`** - an alias of a remote repository we want to push to. Eventually, we may have multiple remote repositories; therefore, we have to name them. However, you will most likely during the bootcamp use the default name which is `origin`, so this command will look like: `git push origin master`;
- **`master`** - the branch we are pushing to on GitHub. We will dive into branches later on.

The command line may prompt you for a username and password but hold for a second before proceeding. The next couple of lines is important before you go ahead and add your credentials.

### Token authentication requirements for Git operations

<br>

![gh-announcement-related-to-tokens](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/gh-announcement-related-to-tokens.png)

<br>

> Source: [The GitHub Blog - Token authentication requirements for Git operations](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/)

What does this mean? To put it in simple English, after the changes that happened in late 2021 in the GitHub authentication process we still *can* use passwords to login to GitHub but to be able to *push* changes to owned or forked repositories, we have to use Personal Authentication Tokens.

Let's do the setup and enable you to push changes you made in the repository locally to your remote repository on GitHub.

<br>

#### Create a Personal Access Token

<br>

:::success
To successfully create the Personal Access Token, follow the guidelines provided by the GitHub organization: **[Creating a token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token)**.
:::

<br>

*Hint 1*: When on a step that requires you to set up the *Expiration*, click on the drop-down menu and select **Custom** to be able to use the calendar picker to set up the custom expiration date. Since you are using all your repositories for learning purposes, we recommend setting up the expiration for 6 months at least so you don't have to go through the process of updating the token too often. Once the token expires, you will be asked to generate a new token.

*Hint 2*: When asked to *Select scopes*, select **repo**. All the other options are considered more advanced and not necessary to be defined for now.

*Hint 3*: After you *generate the token*, make sure you copy it somewhere safe as you will need it at least 2 more times - to make the first push to your repo and to update your GitHub keychain credentials.

Creating and saving a personal token is the last thing you have to do in this step. Proceed to learn how to use it.

<br>

#### Using a token on the command line

<br>

:::success
Once you have a token, you can enter it instead of your password when performing Git operations over HTTPS. Follow the guidelines provided by the GitHub organization: **[Using a token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#using-a-token-on-the-command-line)**.
:::

<br>

As shown in the provided guidelines, you would **use a personal token when *cloning* a repo or *pushing* to a repo when you are asked to enter your password**.

To push the changes you made in the local repo to your GitHub repo:

```shell
git push origin master
```

```shell
Username: your_username
Password: your_token
```

<br>

<!-- This is the username and password to your GitHub account.

:::info
Remember that you won't be able to see the password or the asterisks. That doesn't mean you are not typing - the terminal doesn't allow password visibility for security reasons. Just type your password and hit enter and you will be prompted of success or failure if you made a typo and are asked to type again.
::: -->

:::warning
If you are not prompted for your username and password, your credentials may be cached on your computer. 

Follow the steps listed below based on your machine:

- **Mac OS**

    You can update your credentials in the keychain to replace your old password with the token. 

    Follow the guidelines provided here to successfully update your GitHub credentials on your keychain: **[Updating your credentials via Keychain Access](https://docs.github.com/en/get-started/getting-started-with-git/updating-credentials-from-the-macos-keychain#updating-your-credentials-via-keychain-access)**.

    <br>

    *Hint*: When you open the keychain and in the search bar type "github.com" you should be able to update the credentials. You should **paste the token in the password field and save the changes** you made.

- **Windows OS**

    You can update your credentials in the [Credential Manager](https://support.microsoft.com/en-us/windows/accessing-credential-manager-1b5c916a-6a16-889f-8581-fc16e8165ac0) to replace your old password with the token. 

    1. Go to Credential Manager from Control Panel
    2. Windows Credentials
    3. Find `git:https://github.com`
    4. Edit - on *Password* paste your GitHub Personal Access Token
    5. Save the changes

- **Linux OS**

    Make sure you have a locally configured git client with a username and email:

    ```shell
    git config -l 
    # user.name=your_username
    # user.email=your_email
    ```

    If you don't have it configured, follow the steps:

    ```shell
    git config --global user.name "your_github_username"
    
    git config --global user.email "your_github_email"
    ```

    Now when you try to clone the GitHub repo or push to it, you will be prompted to enter your username and password but instead of a password, you should paste the token.

:::

<br>

Refresh GitHub and you should see the code that you have committed!

<br>

![gh-files-on-gh-after-pushing](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/gh-files-on-gh-after-pushing.png)

<br>

## Pulling From a Remote Repository: `git pull`

Occasionally GitHub repos will have changes that we don't have on our local computer. This can happen when teammates push code to the repo, or when we update code on GitHub manually.
In this situation, we have to use `git pull` to pull code to our local repository from GitHub.
Let's start by modifying a file on GitHub. On the repo's page, click `data.txt`.
On the following page, click the "Edit this File" button:

<br>

![gh-edit-file](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/gh-edit-file.png)

<br>

Modify anything you want in that file and then click "Commit Changes":

<br>

![gh-commit](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/gh-commit.png)

<br>

You have just made a commit to the repository on GitHub, which means that the file has gone through some change in the remote repository on GitHub, but if you open the file locally, nothing has changed.

<br>

![gh-updates-vs-local-file](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/gh-updates-vs-local-file.png)

<br>

To pull our most recent commit from GitHub, we have to use `git pull`:

```bash
git pull origin master
```
<br>

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_78962c431f06d9d34e095a506d7aac3c.gif)

<br>

![git-pull](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/git-pull.png)

<br>

As you saw, the command `git pull` takes two arguments. The first being the **remote alias** and the second being the branch.
If you take a look at `data.txt`, it should have your updates from GitHub!

## Quick Reference

Here you have the most important commands you should have learned in this lesson:

<br>

:::info
**Add a remote repository**

```bash
git remote add <alias> <github-url>
```

**Pushing to Remote Repository**

```bash
git push <alias> <remote-branch-name>
```

**Pull changes from GitHub**

```bash
git pull <alias> <remote-branch-name>
```

:::

<br>

:::success
However, remember, before being able to push your code to the remote repository, you have to do all the steps we covered in the previous lesson:

1. `git init` => we run this command only once, only when initializing the git repo
2. `git add .`
3. `git commit -m"commit message in present tense"`
4. `git push remote-name master`

In the meantime, at any point, you can and should check the changes with `git status`.
:::

<br>

## Summary

In this lesson regarding Git, we have learned:

- how to initialize a Git repository,
- where to initialize a Git repository for an efficient workflow,
- how Git keeps track of changes in the `.git` folder,
- about _working_ and _staging_ areas and how to move files between them,
- how to view commits and what are the different pieces of data we can find in those commits.

These commands will be some of the most commonly used ones and will be crucial for your daily workflow. Get familiar with using them and don't be afraid to use `git status` all of the time!

In this lesson regarding GitHub we covered about:

- what GitHub is,
- how to push code from your local repository to the remote repo on GitHub,
- how to pull code from a GitHub repo to our computer (super useful when working with a team)

<br>

## Extra resources

- [Git - Cheat Sheet](https://github.github.com/training-kit/downloads/github-git-cheat-sheet/)
- [Guide on how to set up Personal Access Token on different operating systems](https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to)
