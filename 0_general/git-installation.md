<!-- # Set up Git -->


# Git Installation and GitHub Account Creation

Today we will guide you through the process of installing Git and creating a GitHub account (in case you haven't done already), step by step.

## Step 1: Install Git

### For Windows and macOS:

1. Go to the [Git website](https://git-scm.com/).
2. You will see an option to download Git for your specific OS (Windows/macOS). Click on the download button.
3. Once the download is complete, open the installer.
4. Follow the on-screen instructions to install Git on your system. You can leave the options at their defaults.

### Linux

1. Open Terminal.
2. Type the following command to update the package database:

   ```sh
   sudo apt update
   ```

3. Type the following command to install Git:

   ```sh
   sudo apt install git
   ```

## Step 2: Verify Git Installation

Verify that Git was installed correctly by typing the following command in your terminal or command prompt:

```sh
git --version
```

## Step 3: Create a GitHub Account

1. Visit the [GitHub website](https://github.com/).
2. Click on "Sign Up".
3. Follow the on-screen instructions to create an account, including verifying your email address.
   
## Step 4: Set Up Git with GitHub

Once your GitHub account is created, set up Git to work with GitHub:

1. Open your terminal or command prompt.
2. Configure your Git username using the following command (replace 'your_username' with your actual GitHub username):

   ```sh
   git config --global user.name "your_username"
   ```

3. Configure your Git email using the following command (replace 'your_email@example.com' with the email address you used to sign up for GitHub):

   ```sh
   git config --global user.email "your_email@example.com"
   ```

## Step 5: Set Up Git GUI (Optional)

If you prefer a graphical user interface (GUI) over the command line, you can set up a Git GUI application such as [GitHub Desktop](https://desktop.github.com/) or [SourceTree](https://www.sourcetreeapp.com/):

1. Visit the website of your chosen Git GUI application.
2. Download and install the application following the on-screen instructions.
3. Once installed, open the application and log in with your GitHub account to link your repositories and start working on your projects graphically.


That's it! You have successfully installed Git and set up a GitHub account. You are now ready to start using Git and GitHub for version control and collaborative coding projects. Happy coding!
