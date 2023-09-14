<!-- ![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Command Line/Terminals -->

## Learning goals

After this lesson, you will be able to:

- Explain what a shell is and why it is used,
- Explain what a terminal (terminal emulator) is and why it is used,
- Navigate the file system using the basic terminal commands.

<br>

## Introduction

You are already familiar with accessing the terminal for your operating system - whether you work on Mac, Ubuntu, or Windows.

In this lesson, we'll explain what *shell* and *terminal* are and what they're used for and show you some basic terminal commands.

<br>

## Shell

[*Shell*](<https://en.wikipedia.org/wiki/Shell_(computing)>) (Operating System Shell) is a program that processes commands and allows you to access the operating system's services.

The operating system *shell*, in general, is accessed through a terminal. It is called a shell because it is the layer that surrounds the operating system.

<br>

## Terminal emulator (Terminal)

A terminal emulator (commonly called **terminal**) is a program that opens a window and lets you interact with the *shell*. In short, the terminal provides access to the operating system.

A terminal provides text-based (keyboard-only) access to the operating system. It differs from an operating system's graphical user interface (GUI). In a graphical interface, you point and click on graphic elements with the mouse/trackpad to perform tasks (create, move, delete folders and files, execute applications, etc.)

A terminal is an essential tool in your [operating system](https://en.wikipedia.org/wiki/Operating_system). It provides many functionalities for interacting with the computer and the operating system, giving the user lots of power.

To perform a specific task or actions from the terminal, we type text commands (e.g., create files/folders, open files/folders, navigate the file system, etc.).

You might ask now: why would I type commands if I can use a mouse pointer to tell my computer what to do? However, there are many benefits of using the terminal over the graphic interface. Let's quickly mention a few:

- **Completing tasks faster**: well, believe it or not, as you will soon see, some tasks can be completed much faster using the terminal than with graphical applications and menus.
- **Advanced configuration and maintenance**: the terminal allows you to execute specific commands to perform system configuration and maintenance. Some of these commands may not be available through the graphic interface or the menus in your operating system.
- **Scripts**: the terminal allows you to create and run command scripts to automate everyday tasks.

<br>

## Default OS Terminals

Each operating system (Mac, Windows, Unix/Linux) comes with a default terminal program already installed:

- _Windows_ includes the program _"cmd.exe"_, which is the default command line interpreter.
- _Mac OS_ includes a program called _"Terminal"_, which we can use to run commands within the Mac OS.
- _Unix_ typically includes a program called _"xterm"_, which we can use to run commands on a Linux OS.

<br>

## Opening the Terminal

To get started with the command line, you'll need to open the terminal window.

When you run your terminal application, your command prompt will start pointing to a specific folder. From there, you can navigate between folders, work with files inside these folders, or perform other actions.

You may find the instructions about opening the terminal on your specific operating system in the sub-sections below.

<br>

:::info
If you still need to do so, we recommend fixing the *terminal icon* in the menu bar (the Dock on Mac) to access your terminal quickly.
:::

<br>

### Opening the Terminal on Mac

Although we've already shown how to *open the Terminal on a Mac*, let's do it again for practice. 

To open the Terminal on a Mac OS, do the following:

1. Open the **[Spotlight Search](https://support.apple.com/guide/mac-help/spotlight-mchlp1008/12.0/mac/12.0)** on your Mac by pressing <kbd>CMD ⌘</kbd> + <kbd>Space</kbd>

2. Then type "Terminal" into the search field

3. Press <kbd>Enter</kbd> to open the Terminal app

   <br>

   <details>
    <summary> Check the image inside</summary>

   ![Spotlight Search for Terminal](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/mac-spotlight-search-terminal.png)

   </details>

<br>

### Opening the Terminal on Linux

Although we've already shown how to *open the Terminal on Linux*, let's do it again for practice.

<br>

**For Linux Ubuntu**:

1. Find a launcher for the Terminal app by clicking on the **Activities** item at the top left of the screen, then type “terminal” or “shell”.

   <details>
    <summary> Check the image inside</summary>

   ![Linux ubuntu search for terminal](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/linux-basic-installations-ubuntu-search-terminal.png)

   </details>

2. Double-click on the **Terminal** app icon to open it. 

   <br>

   <details>
    <summary> Check the image inside</summary>

   ![Linux Ubuntu open terminal](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/linux-basic-installations-ubuntu-open-terminal.png)

   </details>

   <br>

**For other Linux distributions:**

On other distributions of Linux, a terminal launcher is usually found in the same place as your other application launchers. It may be located in a submenu, or you may need to search for it using your launcher, but it's almost certainly somewhere there.

<br>

### Opening the Terminal on Windows

<br>

:::info
As explained earlier in the installation lesson, you will use **Git Bash** as your terminal during this module and later in the course. 
:::

<br>

To open the terminal (Git Bash) on your Windows machine, follow these steps:

1. Press the Windows key (or open the Start menu) and type **_git bash_** in the search bar.

2. Right-click the **_Git Bash_** result to **_Run as administrator_**.

   <br>

   <details>
     <summary> Check the image inside</summary>

    ![Windows 10 open terminal](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/installations/win-installations-prework-gitbash-02.png)

   </details>

<br>   


## Basic Terminal Commands

There are a lot of different commands we can use in the terminal to perform tasks and actions. In this section, we'll go over the basic Unix terminal commands.

Unix terminal commands are used in terminals that run on the Unix operating system (Linux and macOS). However, thanks to Git Bash, we can also use these commands on Windows.

<br>

:::warning
:warning: In the following examples, we'll use terminal comments **`#`** for additional details. The comments are prefixed with a hash symbol (`#`)  and are ignored by the terminal.

**You do not need to type the comments**.
:::

<br>

### Current working directory - `pwd`

The command `pwd` stands for "print working directory". When invoked, the command returns the full path name of your current directory/folder (starting from the root directory). 

In the terminal, navigate to the Desktop folder on your system and then run the command:

```shell
pwd
```

<br>

### List files & directories/folders - `ls`

The command `ls` is one of the basic commands. When invoked, the command will list all the files and folders in the current directory/folder.

In the terminal, run the following command to list all the files in the current folder:

```shell
ls
```

<br>

To display all files and folders, including the *hidden* ones, use the `-a` option:

```shell
ls -a
```

<br>

### Change directory/folder - `cd`

The command `cd`, which stands for "change directory", is a command to change the current working directory. The command expects the name (or the path) of an existing folder we want to navigate.

In the terminal, run the following commands to navigate to the Desktop folder on your system:

```shell
# First, to move to the root folder on your system, run:
cd ~
```

```shell
# Second, to move to the "Desktop" folder, run:
cd Desktop
```

<br>

To **navigate one step back**, out of the current folder, use **`..`** :

```shell
# To navigate one step back, out of the current folder, run:
cd ..
```

<br>

### Make a new directory/folder - `mkdir`

The command `mkdir` stands for "make a new directory". The command takes the name of a new folder you want to create:

In the terminal, run the following command to create a new folder named `practice-terminal-commands`:

```shell
mkdir practice-terminal-commands
```

<br>

Once created, you can change the folders and move to the newly created one using the `cd` command:

```shell
cd practice-terminal-commands
```

<br>

### Create a new file - `touch`

The command `touch` takes the name of a new file you want to create and creates the file in the current directory/folder.

In the terminal, run the following command to create a new file named `practice.txt`:

```shell
touch practice.txt
```

<br>

Once created, you can use the `ls` command to see the file in the current folder:

```shell
ls
```

<br>

## Summary

In this lesson, we have learned:

- What a terminal is and how to access it within your operating system.
- That terminal emulator is used to interact with the shell. The shell allows you to access the services of your operating system.
- The basic Unix terminal commands:
  - `pwd` - prints the current working directory.
  - `ls` - list all the files and folders in the current folder.
  - `cd` - change the working directory.
  - `mkdir` - make a new directory/folder.
  - `touch` - create a new file.

