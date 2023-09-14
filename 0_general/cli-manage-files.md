<!-- ![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Managing files using the Terminal -->

## Learning goals

After this lesson, you will be able to:

- Describe the high-level directory structure and its hierarchy on your local system,
- Navigate the file system on your computer using the terminal,
- List files and directories in a directory using the terminal,
- Create and delete folders using the terminal,
- Create, delete, move and rename files using the terminal.



## Introduction

In this lesson, you will learn about the file system and how to manage files and folders using the terminal. 

Navigating the file system using the terminal and performing the operations we are about to discuss **is a vital** skill for developers. The more efficient you are in using the terminal, the more efficient as a developer you will be.

However, don't stress if you don't have the _speed_ right away - **these skills will come with time and practice**.

<br>

We will use the terminal during the lesson, so **go ahead and open the terminal on your computer** now.



<br>



## File System

### File System Organization

The files on *Unix* (Linux or macOS) and *Windows* operating systems are arranged in a **hierarchical directory structure**. It means that files and folders are organized in a _tree-like pattern_ of directories (folders), which may contain files and other directories.



Any directory (folder) can contain files and subdirectories (nested folders). Subdirectories can, in turn, contain additional files and subdirectories and so on, creating a nested or hierarchical structure.



_When talking about folders, we use the terms directories and subdirectories; these words are synonymous and can be used interchangeably_.



<br>

### Unix Directory Structure (Linux and Mac)

The following diagram represents the Unix directory structure, which is the file system organization of the Linux and Mac operating systems:



![unix directory structure diagram](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/wd-pw-unix-directory-structure.png)

*Note: The above diagram was simplified to highlight only the key directories.*

<br>

### Windows Directory Structure

In a typical Windows Operating System, files and folders are organized in a directory structure, as shown in the diagram below:



![unix directory structure diagram](https://education-team-2020.s3.eu-west-1.amazonaws.com/web-dev/prework/wd-pw-windows-directory-structure.png)

*Note: The above diagram was simplified to highlight only the key directories.*

<br>

### Root Directory

:::info
The top-level directory in the file system is called the **root directory**



- Unix root directory: **`/`**

- Windows root directory: **`\`**

  :::



The **Unix root directory** is denoted by a forward slash **`/`**. This is the top-level directory in the Unix operating systems.



The **Windows root directory** is denoted by a backslash **`\`**. It is usually located on the C drive as `C:\`.



### Home Directory

Each user on a computer has a home directory that contains all of the information for their account,  including the desktop, documents, etc.

<br>

#### Home Directory on Linux/Mac

When you open your *terminal*, you most likely have it waiting for commands in your *home directory*: `/home/<your_username>`.

<br>



#### Home Directory on Windows (Git Bash)

When you open your *Git Bash terminal*, you most likely have it waiting for commands in your *home directory*: `C:\Users\<your_username>`. 

As the Git Bash terminal uses Unix-style paths, the paths are shown with forward slashes (`/`). So, if your username is `ironhacker`, Git Bash will show your home directory path as `/c/Users/ironhacker` instead of `C:\Users\ironhacker`.

<br>



## Tab Auto-completion

Typing the full name of the existing files and folders can be tedious. Tab completion is a handy feature that can save time when navigating the file system. You can use the <kbd>Tab</kbd> key to get the terminal to auto-complete the name for you.



To try it out, run the following command to go back to the root directory:

```bash
cd ~
```

<br>

Next, running `pwd` should display the path of your home folder - `/Users/<your-username>` on Linux and Mac or  `/c/Users/<your-username>` on Windows:

```shell
pwd
```

<br>

If you now run the `ls` command to list all the directories/files you have, you should see the `Desktop` folder among them.

![](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_99d1ea8b03d4b104e9ac708532804c94.png)



So now, if you type:

```shell
cd de
```

and press the <kbd>Tab</kbd> key,  the terminal will auto-complete the folder name for you to:

```shell
cd Desktop
```

This is because `Desktop` is the only name that matches the given string (`de`).

<br>



## Basic System Information Commands

:::warning

:warning: In the following examples, you'll come across code snippets that use placeholders denoted by angle brackets **`< >`** (e.g., `<user_defined_value>`). These are commonly used in technical documentation and syntax examples to indicate that you should replace them with your values.



When running the commands, **replace the `<>` placeholders with values relevant to your code.**

:::

<br>



### Get Hostname - `hostname`

The `hostname` command is used to display the system's hostname, which is a unique name given to a computer connected to a network for identification purposes.



To see the hostname of your system, run the following command in the terminal:

```shell
hostname
```

<br>



### Get Current User's Name - `whoami`

The command `whoami` returns the username of the current user. It can be used with additional flags to show more information, such as the user's system privileges on the local machine.



To display the username of the current user, simply run the command in the terminal:

```bash
whoami
```

<br>



## Navigating the File System

The `cd` command is used to change directories and navigate between them and always requires that you specify a path to the folder to which you want to navigate.



### Absolute vs. Relative Paths

When navigating through the file system and running the commands from the terminal, you can use either *absolute* or *relative paths* to access files and directories.

<br>



#### Absolute Paths

Absolute paths start with the **`/`**, which represents the file system's  **root directory**. This means that when using an absolute path, you always specify the **full path** of a file or directory **starting from the root directory**.



If you are using **Mac or Linux**, you can navigate to your desktop by using the absolute path:

```shell
cd /Users/<your_username>/Desktop
```

<br>

If you are using **Windows (with Git Bash)**, you can navigate to your desktop by using the absolute path:

```bash
cd /c/Users/<your_username>/Desktop
```

<br>

**Note:** In the above examples, `<your_username>` is a placeholder you should replace with your actual username.

<br>



#### Relative Paths

Relative paths, on the other hand, represent the location of a file or directory relative to your current working directory. When you use a relative path, you are specifying the path to a file or directory based on your current location in the file system.

Relative paths are useful when running commands, accessing files, or moving between directories nearby to your current working directory.



To move up one or more directory levels from your current working directory, use the `..` notation.  

For example, to move up one level, run:

```bash
cd ..
```

<br>

To move up two levels, run:

```bash
cd ../../
```

<br>



### `cd` Command - Shortcuts

To navigate more quickly with the `cd` command and move directly to different directories, you can use one of the following shortcuts:



- To navigate directly to the **root directory**, you can use the forward slash (**`/`**):

  ```shell
  cd /
  ```

  <br>

- Navigate directly to your **user's home directory** (**`~`**):

  ```shell
  cd ~
  ```

  <br>

- Navigate directly to the **previous working directory** (**`-`**):

  ```shell
  cd -
  ```

  <br>





### `ls` Command - Additional Flags

Command flags are special parameters that change how a terminal command behaves (e.g., provide additional information, customize the output, etc.). They are represented by either one (`-`) or two dashes (`--`), followed by an option or a value.



The `ls` command is used to *print the list of files and directories* in a directory. You may change the output format of the `ls` command and tell it what information to show by using flags.



Here are a few examples to give you an idea of the flags available for the `ls` command. Try running these commands in a folder on your system to see how they modify the output format of the `ls` command:



- Get a detailed listing: **`-l`**

  ```shell
  ls -l
  ```

  <br>

- Sort the results by file time: **`-t`**

  ```shell
  ls -t
  ```

  <br>

- Sort by file size: **`-S`**

  ```shell
  ls -S
  ```

  <br>

  Sort by file extension name: **`-X`**

  ```shell
  ls -X
  ```

  <br>

- Reverse the sorting: **`-r`**

  ```shell
  ls -r
  ```

  <br>

- Show hidden files: **`-a`**

  ```shell
  ls -a
  ```
  
  <br>



#### Combining Flags

You can also combine these flags to get a more detailed listing with additional information about the files. For example:



- Get a detailed listing (`l`), including hidden files (`a`):  **`-la`**

  ```shell
  ls -la
  ```

  <br>

- Get a detailed listing (`l`), including hidden files (`a`), sorted by extension name (`X`):   **`-laX`**

  ```shell
  ls -laX
  ```

  <br>

  

**Note:** The directories in the listing that appear as `.` and `..` represent the current folder (`.`) and the parent folder (`..`).

<br>





## Create and Remove Folders/Directories



### Make a new directory - `mkdir`

The command `mkdir` stands for "make a new directory". The command takes the name of a new folder you want to create.



To create a new folder, run the `mkdir` command followed by the name you want the folder to have:

```bash
mkdir new-project
```

<br>



### Remove a directory - `rmdir`

The command `rmdir` stands for "remove a directory" and is used for deleting folders. The command takes the *path* or the *name* of the folder you want to delete. Here are a few examples:



#### Remove a directory by name

To delete a folder in the current directory, run the `rmdir` command followed by the *folder name*:

```bash
rmdir <folder-name>
```

<br>

For example, to delete a folder named `new-project` in the current working directory, you would run:

```shell
rmdir new-project
```

<br>



#### Remove a directory by path

To delete a folder in another directory, run the command followed by the *path* to the folder:

```bash
rmdir  /path/to/folder
```

<br>

For example, to delete a folder in the `/Desktop` directory named `old-projects`, you would run:

```shell
rmdir ~/Desktop/old-projects
```

<br>

**Note:** In the above example, the path starts from the **home directory**, represented by the tilde **`~`**.

<br>



## Create and Remove Files

### Create a new file - `touch`

The command `touch` takes the name of a new file you want to create and creates the file in the current directory/folder.



#### Create a single file

To create a new, blank file, run the `touch` command followed by the desired *file name and extension*:

```shell
touch  filename.extension
```

<br>

For example, you can try running the following command in a folder of your choice to create an HTML file named `index`:

```shell
touch index.html
```

<br>



#### Create multiple files

To create multiple files, run the `touch` command followed by the names of the files you want to create:

```bash
touch  file.txt  file1.txt  file2.txt  file3.txt  file4.txt  file5.txt
```

This will create six (6) files named `file.txt`, `file1.txt`, `file2.txt`, etc., in the current directory.

<br>



### Remove a file - `rm`

The command `rm` stands for "remove" and is used to delete one or more files.



#### Remove a single file

To remove/delete a single file, run the `rm` command followed by the *file name and extension*:

```shell
rm  filename.extension
```

<br>

For example, to remove a file named `index.html`, you would run the command in the following way:

```shell
rm index.html
```

<br>



#### Remove multiple files

To remove multiple files at once, use the `rm` command followed by the names of the files you want to remove:

```shell
rm  filename1.extension  filename2.extension  filename3.extension
```

<br>

For example, to remove three (3) files named `file1.txt`, `file2.txt` and `file3.txt`, you would run the command in the following way:

```bash
rm file1.txt file2.txt file3.txt
```

<br>



#### Remove a directory and nested files and folders - `rm -rf`

To remove a directory and all its nested files and folders, you can use the `rm -rf` command followed by the folder name or path:

```bash
rm -rf <folder-name>
```

or

```bash
rm -rf /path/to/folder
```

<br>

The `r` flag stands for "recursive", which will make rm remove folders and all their contents recursively.

The `f` flag stands for "force", which will make `rm` directly remove files and folders without first prompting you for confirmation.

<br>

:::warning

:exclamation:**Important:** The `rm -rf` can be dangerous and should be used with caution! The command is destructive and will erase the specified folder and all its contents without asking for permission.



Make sure to double-check the folder you're targeting before executing this command!

:::

<br>



## Display File Contents - `cat`

The command `cat`, which stands for "concatenate", allows you to view the contents of a file in the terminal without having to open the file.



To display the contents of a whole file, run the `cat` command followed by the file name:

```shell
cat <filename>
```

<br>

**Note:** In the above example, `<filename>` is a placeholder you should replace with the actual filename.

<br>



## Copying files - `cp`

The `cp` command, which stands for "copy", is used for copying files or the contents of a directory.



#### Copy a file to the same folder

To copy a file to the same folder, run the `cp` command followed by the existing file's name and the desired new file name:

```bash
cp  file1.extension  copied.extension
```

<br>

For example, to copy the file `index.html` and make a copy named `index_copy.html`, you would run:

```bash
cp index.html index_copy.html
```

<br>



#### Copy a file to another folder

You can also copy a file to another directory using the `cp` command.

To copy a file to another directory, you have to specify the destination folder path and a new file name:

```shell
cp  file1.extension  /path/to/destination/folder
```

<br>

For example, to copy the file `index.html` from the current directory to a directory `~/Desktop`, you would run:

```shell
cp index.html ~/Desktop
```

<br>



## Move or Rename files - `mv`

The `mv` command can be used  to move a file to a new location or rename it.



#### Rename a file

To rename a file, run the `mv` command followed by the original filename and the new filename:

```shell
mv <filename> <new_filename>
```

<br>

To rename a file named `file.txt` to `apple-pie-recipe.txt`, you would run:

```shell
mv  file.txt  apple-pie-recipe.txt
```

<br>

**Note:** In the above examples, `<filename>` and `<new_filename>` are placeholders that you should replace with the actual filenames.

<br>



#### Move a file 

To move a file to a different directory using `mv`, specify the path of the destination directory:

```bash
mv  <filename>  /path/to/destination/folder/
```

<br>

For example, to move a file named `file.txt` to the `Desktop` directory, you would run:

```bash
mv file.txt ~/Desktop
```

<br>





## Summary

In this lesson, we have learned about file systems and the following concepts:

- Files and folders are organized into a tree-like hierarchical structure.

- What a typical directory structure looks like on Unix (Linux/Mac) and Windows operating systems.

- Difference between the *home directory* and the *root directory*.

- *Absolute path*: a path to a file or directory starting from the root directory (`/`)

- *Relative path*: a path relative to the current working directory (or another directory).

- The `cd` command shortcuts:  `cd /`,  `cd ~`,  and  `cd -` 

- The `ls` command flags:  `-l`,  `-t`,  `-S`,  `-X`,  `-r`,  `-a`

- Additional Unix terminal commands:

  - `mkdir` - make a new directory/folder
  - `rmdir` - remove a directory/folder
  - `touch` - create a single file or multiple files
  - `rm` - remove a single file or multiple files
  - `rm -rf` - remove a directory and all nested files and folders (caution!)
  - `cp` - copy a single file or multiple files
  - `mv` - move or rename a file
  - `cat` - display file contents on the terminal

  

Moving files to folders using a mouse is _ok_, but using the terminal allows you to do it much faster while having access to the advanced capabilities and services that your operating system provides. Keep practicing, but don't worry too much for now; by the end of the course, you will be a pro.



## Extra resources

- [Command Line Cheat Sheet - Git Tower](https://www.git-tower.com/blog/command-line-cheat-sheet/)
- [Terminal Cheat Sheet for Mac (including shortcuts)](https://github.com/0nn0/terminal-mac-cheatsheet)
- [The Command You Should Never Run - sudo rm -rf](https://linuxstans.com/sudo-rm-rf/)
