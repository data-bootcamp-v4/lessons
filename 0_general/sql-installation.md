<!-- # Set up MySQL -->

## Introduction

SQL  (Structured Query Language) is a programming language developed for managing data in relational database management systems (RDBMS). There are several types or "flavors" of SQL: MySQL, ORACLE_SQL, SQL-Server, or PostgreSQL.

All of them have pretty similar syntax, although there are some minor differences for some specific commands. In this bootcamp, we will be using MySQL as it is one of the most used "flavors" and it's open source. Given the fact that the differences between flavors are limited, getting a solid background in MySQL will allow you to switch easily to any other.

To be able to use SQL on your computer, you will need two elements: 
- the "server" and, 
- the "manager" 

The server is used to create databases on your computer. However, the server alone is not enough to "interact" with databases in a user-friendly way. You will need a "user interface" to be able to perform CRUD (Create, Read, Update and Delete) operations on databases (and tables, of which databases are built of).

As mentioned, we are going to use [MySQL](https://www.mysql.com/) as the database management system (DBMS). 

<br>

:::warning
:star: The installation process is long and can be complicated (but no need to panic), so please follow the steps shown below **carefully**. :100: 
:::

<br>

The installation process depends heavily on your operating system. At the time of writing this document (October 2022), the Windows installer will allow installing the "server" and the "manager" at the same time. However, the process takes longer time and it's more complex. 

**Again, please follow carefully the instructions for your operating system**.

<br>

## Installing the server - MySQL Community Server

Please be aware that there are several versions of the server. To install the server go to the **DOWNLOADS** section for [MySQL Community Server](https://dev.mysql.com/downloads/mysql/), select the latest available version of your operating system on the dropdown menu, download the installer and follow the instructions to install it.

<br>

:::warning
**CAUTION!!** 

After you click on the button to download the installer, another web page will open and you will be asked to "Login Now or Sign Up for a free account". **Don't click on any of the "Login" or "Sign Up" buttons**, just go to the bottom of the page and click on "No, thanks just start my download" as shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_engine_download.png).
:::

<br>

### Windows Users

<br>

<details style="font-size: 14px; cursor: pointer; outline: none; color: #575d70;">
<summary> Instructions </summary>

<br>

Once you are on the downloads page, make sure to click on the rectangle shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_1.png) ignoring the other zipped installers. Next, you will be presented with two possible installers (the version might be different in your case but this is not relevant at this point). You need to download the [second one](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_2.png) because it contains all the elements needed for the installation. 

Open the installer and follow the steps shown down below carefully on each screen. 

<br>

**Setup Type**:

By default, the option "Developer Default" will be selected. However, change it to "Custom" by clicking on the corresponding radio button shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_3.png)

<br>

**Select products**:

You will be presented with two panels. On the left, you will see a set of elements to install collapsed with a "+" sign. On the right panel, you will see the elements marked for installation (empty at the beginning). In between both panels, you will see some gray arrows that will allow you to move elements from the left panel to the right panel. These arrows will turn green as soon as you select one element from the left panel. For this bootcamp, you will need four elements.

Expand the options on the left panel by clicking on the "+" sign and select the **following elements to install** and click on the green arrow (pointing to the right to add these elements into the right panel for installation):
  - MySQL Server
  - MySQL Workbench
  - MySQL Shell
  - Connectors/Python

as shown in the following [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_4.png). Also, make sure to select the "Connectors/Python" as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_5.png).

<br>

**Check requirements**:

The installer **might show you** a list of "Requirements" to install. 
Those "requirements" are a set of additional programs needed by the installer before installing the selected "elements" from the previous step. 
Typically it will be: "Microsoft Visual C++ 2019 Redistrib". If that's the case, click on "Execute" and wait until the download is finished. At this point, a new popup window will appear to install this requirement as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_6.png). 
Accept the license agreement and install "Microsoft Visual C++". 
Once the installation of "Microsoft Visual C++" is finished, you will be sent back to the MySQL installer and all the elements of the "Requirements" window should have a checkmark on the left. 
Click on "Next" and proceed to the next screen.

<br>

**Installation**:

Simply click on "Execute" and wait until all the "Requirements" are installed. Then, click on "Next".

**Product Configuration**:

Click on "Next".

**Type and Networking**:

Leave the default options as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_7.png) and click on "Next".

**Authentication Method**:

Leave the default options as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_8.png) and click on "Next".

**Accounts and Roles**:

In this [screen](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_9.png) you will have to set up the password for the "Root" user. **IMPORTANT: Please make sure to write store this password in a notebook or a text editor** because you will need it during the bootcamp. Other two important considerations about this password are:

- It's case sensitive
- Don't include the following symbols (`@#\!`), otherwise, you will have problems during the bootcamp

and then, click on "Next".

**Server File Permissions:**

Leave the default options as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_9b.png) and click on "Next".

**Windows Service**:

Leave the options as default and click on "Next".

**Apply Configuration**:

Click on "Execute".

This will finish the installation process (it will take several minutes, be patient). Wait until all the elements are installed and click on "Finish".

**Product Configuration**:

Click on "Next".

**Installation Complete**:

In this screen please uncheck the option "Start MySQL Shell after setup" as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/windows_installer_10.png) and click on "Finish".

After the previous step, Windows will start the "MySQL Workbench" program.

</details>

---

### MacOS Users

<br>

<details style="font-size: 14px; cursor: pointer; outline: none; color: #575d70;">
<summary> Instructions </summary>

<br>

:::warning 
Some newest MacOS computers come with a new architecture. Therefore, you need to be careful in selecting the right installer for your architecture. 

Find out which is the architecture of your Mac.

To do that, please follow the steps shown [here](https://support.apple.com/en-us/HT201581). Next, on the screen that will appear, go to the line "Processor" and check if you can find the *keyword* "Intel" as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_computer_info.png). If that's the case, please select the option "x86 64-bit" on the "Select OS Version" dropdown menu as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_intel_installer.png), download the DMG file and proceed with the installation. 

If you can't find the *keyword* "Intel", please select the option "ARM 64-bit" on the "Select OS Version" dropdown menu as shown [here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_arm_installer.png), download the DMG file and proceed with the installation.
:::

<br>

:::info
During the installation process, you might be asked to provide a user and password. If so, use "root" (without the quotes) for the user. On the other hand, the password to input must be different from your computer password. **IMPORTANT: PLEASE KEEP THOSE VALUES SAFE because you will need them later during the bootcamp.**
:::

<br>

After you click on the button to download the installer, another web page will open and you will be asked to "Login Now or Sign Up for a free account". **Don't click on any of the "Login" or "Sign Up" buttons**, just go to the bottom of the page and click on "No, thanks just start my download" as shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_engine_download.png).

<br>

During the installation process, you might be asked to provide a user and password. If so, use "root" (without the quotes) for the user. On the other hand, the password to input must be different from your computer password.

<br>

:::info
**IMPORTANT: PLEASE KEEP YOUR PASSWORD SAVED AND SIMPLE because you will need them later**.

In general, you should keep your MySQL root password **simple** and **easy to remember** and **saved somewhere** as the process of creating a new password can be sometimes quite complicated.

We suggest, as you will be working with a small database without any sensitive information in it, to make your password value equal to "password" or something super intuitive. 

Also, one thing to keep in mind, **don't use the special characters `@#\!` as a part of your password** as it makes your connection string super tricky to create.
:::

<br>

**CAVEAT!!** The latest version of the installer needs to have **Visual Studio** installed in your system (among other programs that the installer can install for you in your system just by clicking on `Execute`). If you get a screen like [this](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_engine_issue.png), please leave the installer and follow the steps shown below:

- Go to [this website](https://code.visualstudio.com/)
- Download the right installer for your operating system
- Install Visual Studio
- Run the MySQL Installer again

<!-- **CAVEAT!!** At the time of writing this document, for Windows systems the "engine" requires you to have Python version `<=3.8` installed in your computer to proceed. If this condition is not met (maybe because you have a newer Python version installed on your computer like Python 3.9), the installer will not proceed. In this case, cancel the installation process. Uninstall Python 3.9 from your computer, install Python 3.8 and install the MySQL engine again. -->

<br>

### Installing the manager - MySQL Workbench (Only MacOS Users)

The next step is to install the "manager". In this course, we will use [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) because it is pretty popular, easier to use, and less troublesome. Please, select the latest version for your operative system in the dropdown menu, download the installer and install it. 

Remember the **USER and the PASSWORD** you entered during the "engine" installation process as you will need them again to set up a connection against the server.

</details>

#### CAVEAT for macOS users

<br>

<details style="font-size: 14px; cursor: pointer; outline: none; color: #575d70;">
<summary>Issues</summary>

<br>

The most recent Apple computers with M1 chips have enhanced security which prevents launching *MySQLWorkbench*. When you try it, a new popup window is displayed saying: 

<br>

*"MySQLWorkbench can't be opened because Apple cannot check it for malicious software"*

<br>

If this happens, please follow the steps shown below:

1. Click on "Ok"
2. Go to the top left corner of your screen and click on the "Apple" icon and a new menu will appear. If you can't see the "Apple" icon hold on the cursor on the top of your screen for a couple of seconds and a new menu will appear with the icon.
3. In the resulting menu select "System Preferences"
4. Click on "Security and Privacy"
5. At the bottom of the resulting window you should see: "MySQLWorkbench" was blocked from use because it is not from an identified developer
6. Click on the left button which says: "Open anyway"
7. A new popup window will appear with three buttons. Click on the "Open" button

</details>

---

### Linux Ubuntu Users

<details style="font-size: 14px; cursor: pointer; outline: none; color: #575d70;">
  <summary> Instructions </summary>
<br>

**Download the package**

1. The first step is to download the Linux deb package from [here](https://dev.mysql.com/downloads/repo/apt/).

2. Once you are on the downloads page, click on the **Download** button and proceed to save the package on your computer. 
   On the following page, you will be prompted to create an account but this is not necessary. 
   Instead, click on the link to start the download as shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_download.png).

<br>

**Adding the MySQL APT Repository**

1. Next, you will have to open the terminal and navigate to the folder in which you have downloaded the package. From the terminal, run the following command, replacing *`version-specific-package-name`* with the name of the downloaded package (preceded by its path, if you are not running the command inside the folder where the package is):

2. Execute the following command from the terminal, replacing ***`version-package-name`*** with the name of the package you downloaded (starting with the path if you are not inside the folder containing the package):

   ```bash
   sudo dpkg -i version-specific-package-name.deb
   ```

   > For example, the command for the package  `mysql-apt-config_0.1.2-3_all.deb` is:
   >
   > ```bash
   > sudo dpkg -i mysql-apt-config_0.1.2-3_all.deb
   > ```

3. Once the installation starts, you might be asked to provide the password for the "root" user on your system.

4. During the installation process, you will be asked to choose the versions of the MySQL server and other components (for example, the MySQL Workbench) that you want to install. You can configure each item by selecting it and pressing `Enter`. You should configure it in the following (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_configure_items_1.png)):

   - MySQL Server & Cluster  >>  Leave as it is
   - MySQL Tools & Connectors  >>  Currently selected: **Enabled**
   - MySQL Preview Packages  >>  Currently selected: **Enabled**

   Select **`OK`** once you are done with the configuration (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_configure_items_2.png)).

5. Once the installation is done, run the following command in the terminal to update the package information:

   ```bash
   sudo apt-get update
   ```

<br>

**Install MySQL Server**

1. Once you are done with the previous steps, run the following command in the terminal to install MySQL:

   ```bash
   sudo apt-get install mysql-server
   ```

2. During the installation process, you will be asked to provide a password for the "root" user. The password to input should be different from your computer password. **IMPORTANT: PLEASE WRITE DOWN YOUR PASSWORD AND SAVE IT because you will need it later during the bootcamp.**

3. In the next step, you will be prompted to select the default authentication plugin. You should select the **RECOMMENDED** option, as shown in the [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_configure_authentication_plugin.png).

<br>

**Install MySQL Workbench and client libraries**

1. First, run the following command in the terminal to get the latest package information from the MySQL APT repository:

   ```bash
   sudo apt-get update
   ```

2. Next, to install MySQL Workbench from Snap, run the following command in the terminal:

   ```bash
   sudo snap install mysql-workbench-community
   ```

3. Once that is done, install the remaining MySQL client libraries by running the terminal command:

   ```bash
   sudo apt-get install libmysqlclient21
   ```

<br>

**Allow Workbench to access the password stored in the keychain**

In the previous step, you installed MySQL Workbench from Snap. As a Snap package, MySQL Workbench is sandboxed and doesn't have access to the passwords stored in the keychain on your system. To fix this you'll have to do the following:

- Open **Ubuntu Software** application (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_mysql_workbench_1.png))
- Search for and open: **mysql-workbench-community** (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_mysql_workbench_2.png))
- Once in the application panel, click the **Permissions** button (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_mysql_workbench_3.png))
- In the Permissions panel, enable the following options (see [image](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_ubuntu_mysql_workbench_4.png)):
  - **Read, add, change, or remove saved passwords**
  - **ssh-keys: allows reading ssh user configuration and keys**
- **Close** the Permissions panel and the Ubuntu Software center.

</details>

<br>

### Other Linux Distributions

<details style="font-size: 14px; cursor: pointer; outline: none; color: #575d70;">
<summary> Instructions </summary>

    <br>

The installation depends heavily on which kind of Linux distribution that are you using:

- **Debian-based distributions:**
  - Please download the deb package from [here](https://dev.mysql.com/downloads/repo/apt/)
  - Please read and follow the instructions provided [here](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install) and install the following:
    - MySQL
    - MySQL Workbench
- **Suse distributions:**
  - Please download the rpm package from [here](https://dev.mysql.com/downloads/repo/suse/)
  - Please read and follow the instructions provided [here](https://dev.mysql.com/doc/mysql-sles-repo-quick-guide/en/) and install the following:
    - MySQL
    - MySQL Workbench  
- **RedHat distributions:**
  - Please download the rpm package from [here](https://dev.mysql.com/downloads/repo/yum/)
  - Please read and follow the instructions provided [here](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/) and install the following:
    - MySQL
    - MySQL Workbench
- **Fedora distributions:**
  - Please download the rpm package from [here](https://dev.mysql.com/downloads/repo/yum/)
  - Please read and follow the instructions provided [here](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/) and install the following:
    - MySQL
    - MySQL Workbench
- **Generic distributions:**
  - Please download the rpm package from [here](https://dev.mysql.com/downloads/mysql/)
  - The installation instructions are available in the *info tab* :information_source: on the [same page](https://dev.mysql.com/downloads/mysql/). Follow the instructions for your release and install the following:
    - MySQL
    - MySQL Workbench

</details>

<br>

## Setting up and establishing a new connection

<br>

Once you finish installing the "manager", you will need to set up a "connection". Open the application MySQL Workbench. You should see a window like [this](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_1.png) (without the "Ironhack" box, which is the "connection"). 

To create a connection, click on the "+" sign right after the "MySQL Connections" [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_2.png). Then a new window will pop up called "Setup New Connection" [like this](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_3.png). Now, follow these steps:

1. In the "Connection Name" [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_4.png) box input "Ironhack". 
2. In the "Username" box [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_5.png) replace "root" with the "user" you input during the "engine" installation process (if you weren't asked to provide a "username" during the installation process, go to the next step). 
3. Finally in the "Password" box, click on "Store in Keychain" [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_6.png) and provide the password you set during the "engine" installation process. 
4. Finally click on "Test connection" [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_7.png). You should get a response of successful connection being established.
5. Click on "Ok" [see here](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_8.png).

Now you will be taken back to the main screen and you should see a new box called "Ironhack". 

<br>

## Testing the new connection

Now in the main menu, you can "double click" on the "Ironhack box" and you should end with a very similar screen to [this one](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_9.png). In the left panel you should be able to find two tabs:

- Administration
- Schemas

**CAVEAT**: Windows users will find the tabs on top of the panel, while macOS users will find them on the bottom.

<!-- Now in the main menu, you can "double click" on the "Ironhack box" and you should end with a very similar screen to [this one](https://education-team-2020.s3.eu-west-1.amazonaws.com/data-analytics/prework/images/mysql_setup_new_connection_9.png). In the left panel called "Schemas", you should only see "sys". -->


"Schemas" you should see *at least "sys"*, but other databases might appear depending on your operative system and your installer.

<br>

If that's the case, congrats you finished the installation!

<br>

## Common Installation Problems

If you are having problems with the installation you can also check the **[official documention](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/)** from MySQL and look through the list below of some common problems:

- **Permission Denied**
  - Problem: The installer doesn't have the necessary permissions to install the software.
  - Solution: Run the installer as an administrator or a superuser.
- **Insufficient Disk Space**
  - Problem: Not enough disk space to install the software.
  - Solution: Free up some disk space by deleting unnecessary files or applications.
- **Incompatible Operating System**
  - Problem: The software is not compatible with the operating system.
  - Solution: Check the software requirements and make sure you are using a compatible operating system.
- **Corrupted Installer**
  - Problem: The installer file is corrupted.
  - Solution: Download the installer again from the official website.
- **Missing Dependencies**
  - Problem: The software relies on other software or libraries that are not installed on the system.
  - Solution: Install the required dependencies. The software documentation or installer usually lists the required dependencies.
- **Installation Interrupted**
  - Problem: The installation process was interrupted.
  - Solution: Restart the installation process. If the problem persists, restart the computer and try again.
- **Failed to Establish a Connection**
  - Problem: The installer or software is unable to establish a connection to the internet or a server.
  - Solution: Check your internet connection and make sure it is stable. Also, check if any firewall or security software is blocking the connection.
- **Software Conflicts**
  - Problem: The software conflicts with other software already installed on the system.
  - Solution: Uninstall or disable the conflicting software and try the installation again.
- **Incorrect Architecture**
  - Problem: The installer or software architecture (32-bit or 64-bit) is not compatible with the system architecture.
  - Solution: Download and install the correct version of the software that matches your system architecture.
- **Failed to Create a Database Connection**
  - Problem: The software is unable to connect to the database.
  - Solution: Check the database connection settings and make sure they are correct. Also, make sure the database server is running and accessible.
- **Unable to Write to Directory**
  - Problem: The installer or software is unable to write to the installation directory.
  - Solution: Check the permissions of the installation directory and make sure the installer or software has write access.