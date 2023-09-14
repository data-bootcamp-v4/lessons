## How to use Git and GitHub for the Labs/Assignments

In this document, you will find all the steps you should follow when working on the labs.

### Why should you use version control

![vc](https://github.com/data-bootcamp-v4/lessons/blob/main/img/version-control.png?raw=true)

- **Tracking Changes**: Maintain a detailed history of project changes, enabling easy comparison, retrieval, and understanding of project evolution over time.
- **Collaboration**: Enable seamless teamwork and efficient collaboration by allowing multiple individuals to work on the same project simultaneously, track changes, and merge modifications.
- **Error Recovery**: Serve as a safety net, enabling easy recovery from errors or mistakes by reverting to known stable states or identifying problematic changes.


### What is Git and GitHub

![git-github](https://github.com/data-bootcamp-v4/lessons/blob/main/img/git-github.png?raw=true)

**Git** is a version control system that helps you track changes in your project files over time. It allows you to save different versions of your work and easily switch between them.

**GitHub** is a website where you can store and share your Git repositories. It provides a user-friendly interface for managing your code and collaborating with others. It also allows the teaching team to see your work.


### The steps to succeed during labs
1. **Fork**: the action of copying someone’s repo into your account
2. **Clone**: downloads a version of the project into your computer
3. **Work**
4. **Add**: Getting ready to save your changes by telling Git which files or modifications should be included in the next snapshot (commit). Not mandatory, but recommended.
4. **Commit**: creates a new snapshot of your project and saves the latest changes you added
5. **Push**: the action of uploading new changes to the project into the GitHub online repository
6. **Share** 

If you work with peers, you will also use pull (the action of updating a previously downloaded repository), merge (combining changes from one branch into another, integrating the modifications into a single unified branch) and more. We will learn this later on the bootcamp.


### Detailed step by step instructions 

In the following guide, the option to use `git` with the terminal on your local machine and `GitHub Desktop` are both explained. You should follow steps 1-4, and then decide if you would like to use GitHub Desktop (instructions under the heading “Using GitHub Desktop” steps 5-13) or use the terminal (instructions under the heading “Using the terminal” steps 5-13).

The first time you work with Git, you need to [install](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) it. Other source for instructions [here](https://github.com/git-guides/install-git).

1. Open the lab link from the student platform.
2. Log in to GitHub.
3. Fork the repository. 
	
	The majority of time, you will have to start the process with forking. Just a quick reminder on what is the process of forking.

	:::info
	Creating a “fork” is producing a personal copy of someone else’s project. Forks act as a sort of bridge between the original repository and your personal copy.
	:::
	If you forked someone's project, you will be able to push your code (this is called _making pull request_) so the owner of the original project can check it and if they find it useful, use it.
	
	**During your Ironhack journey, you have to fork each lab to be able to submit it. This way, your TAs, and instructors will be able to check your work and give you feedback.**
	
	#### How to fork?
	
	<small>All the examples will be related to your Ironhack journey, and they will point to the [`ironhack-labs`](https://github.com/ironhack-labs) GitHub organization. </small>
	
	Navigate to the repository you want to fork. Let's take an example of the prework [HTML exercise](https://github.com/ironhack-labs/lab-html-exercise).
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_926952599ca89301b826696c209fd338.png)
	
	After clicking on the fork button, you will be presented with the loading screen that will most likely look like this:
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_10963380e2cfbaab068f92027378ebed.png)
	
	After the forking is done successfully, you will be redirected to the **copied repository on your GitHub account**.
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_ab52ba11af58807f2b0ce6bc33eddcd4.png)
	
	We are done here with the forking process.

4. Clone the repository. 


	Now, on your GitHub account, you have access to the copied repository. This will be repository you will copy (clone) to your local machine, and that will be your working area.
	
	#### How to clone repository?
	
	Click on the green ‘Code’ button and copy the link by selecting and copying or by using the clipboard button.
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d60e750aafbfe7838bbdbf28619561c4.png)
	
	Make sure that you are in your GitHub account (on the top of the page you should see your username/name_of_forked_lab).

	#### Using GitHub Desktop

5. [Install](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop) and open GitHub Desktop.
6. Finish cloning the lab. Look for `Clone repository` in GitHub Desktop, and paste the link afterwards. For example, in Mac, you might see something like the following:
	
	![img_clone2](https://github.com/data-bootcamp-v4/lessons/blob/main/img/clone-2.png?raw=true)
	
	![img_clone2](https://github.com/data-bootcamp-v4/lessons/blob/main/img/clone-3.png?raw=true)
	
6. Using cloned repository locally. Navigate into the cloned folder, edit files or create new files as specified in the lab.

7. Uploading your changes to your GitHub account (online)

	1. Selecting the files you want to commit in GitHub Desktop.
	2. Write a commit message and click "Commit"
	
		![img_commit](https://github.com/data-bootcamp-v4/lessons/blob/main/img/commit-message.png?raw=true)
	
	3. Click on "Push"
	![img_push](https://github.com/data-bootcamp-v4/lessons/blob/main/img/push-to-origin.png?raw=true)

8. Copy the link to the directory of the lab in your GitHub account and paste it into student platform.
9. Have some rest and get ready for tomorrow!


*You can repeat step 7 as many times as you want, and your changes will be updated on GitHub. This way, we will be able to see the latest version of your lab.*

#### Using the terminal

	
5. Finish Cloning the lab

	- Open the folder where you want to store your lab, and open the terminal there, or open your terminal and navigate to the location where you want to store the local version of your repository.

		You can navigate in the terminal to the folder where you want to store your lab, using as many times as necessary until you get to the folder you want  

	```
	cd name-of-next folder
	```
	
		
	
	![img-cli-navigate](https://github.com/data-bootcamp-v4/lessons/blob/main/img/cli-navigate.png?raw=true)
	
	- When you navigated to the correct folder in your terminal run the following command:
	
	```shell
	$ git clone <paste url from the clipboard>
	```
	
	Check the image below if you have any doubts:
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_84541b74195c3a6bb9cde5ff753e3118.png)
	
	- Once the cloning process is done, you see the following information in your terminal. And you can check that repository was successfully cloned from GitHub to your local machine by running `ls` command in your terminal:
	
	![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_ab79b2e53c91a60727bcb4722a251df3.png)
	
	The cloning process is finished with this step. Now you can use the code to make changes before we proceed to the next step, which is pushing the changes to the forked repository on your GitHub.
	
6. Using cloned repository locally. Navigate into the cloned folder, edit files or create new files as specified in the lab.

7. Uploading your changes to your GitHub account (online)
	1. Add the modified files with “git add .”, or instead of . write the names of the files you want to add separated by commas.
	
		```
		git add .
		```
	
	2. Then use “git commit -m ‘your message here’”
	
		```
		git commit -m  "fixed scatterplot axis"
		```
	
	3. Use “git push”
	
		```
		git push
		```

8. Copy the link to the directory of the lab in your GitHub account and paste it into student platform.
9. Have some rest and get ready for tomorrow!

*You can repeat step 7 as many times as you want, and your changes will be updated on GitHub. This way, we will be able to see the latest version of your lab.*

### Extra resources
- [GitHub Desktop Official Documentation](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/getting-started-with-github-desktop)
- [GitHub CLI - Command Line](https://docs.github.com/en/github-cli)