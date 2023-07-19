# Python Analytics Quest: Escape Room 

## Overview

Welcome to the Python Analytics Quest! Your mission: code a text-based game, 'Escape Room', utilizing Python skills learned in the bootcamp. By doing this, you'll reinforce Python theory, enhance teamwork, and problem-solving skills. Ready? Let's go!

## Setup

### Team Roles

You'll work on the quest in a team of four, split into two pairs: the **Dev Team** and the **Research Team**.

**Dev Team:** Responsible for the game's coding such as constructing the game's structure and functions, ensuring smooth game flow and that the project requirements are met. Pair programming is strongly encouraged to allow collaborative problem-solving, exchange of ideas, and ensure quality in your code.

**Research Team:** This team is responsible for researching topics that are relevant to the project and then sharing that information with the Dev team. They will also apply the findings to the project, so each team has hands-on experience each day.

Note: Roles will **rotate daily** for skill diversification.

## Typical Day

Each day the Dev team and Research team have different responsibilities in order to meet the requirements of the quest. With an exception of day 1, where you will have some time allocated to read the project brief in full (this page) each day should be structured like this:

### Collaborative Development & Research Hour (pairs) | 14:00 - 15:00

- **Dev Team:** Implements daily topic-related code into the game.
- **Research Team:** Carries out topic-specific research.

### Interactive Knowledge Exchange (full group) | 15:00 - 15:30

- **Dev Team:** Shares coding progress and challenges with Research team.
- **Research Team:** Shares research findings and key takeaways with Dev team.

### Application & Testing Phase (full group) | 15:30 - 16:30

- **Research Team:** Applies research findings to the game.
- **Dev Team:** Supports Research team, tests changes and ensures seamless code integration.

## Topics by Day

Each day teams focus on different topics. These topics dictate the Dev Team's coding and Research Team's research activities. Detailed instructions for each day are provided. Remember, these are suggested paths; you can manage your team as long as the requirements are met.

**Dev Team Key Topics:**

- **Day 1**: Create dictionaries and lists serving as game data structures.
- **Day 2**: Define functions and introduce flow control logic.
- **Day 3**: Refine functions and flow control, adding interactivity.
- **Day 4**: Finish implementing all of the game’s code.

**Research Team Key Topics:**

- **Day 1**: Learning how to read Python error messages, function documentation and reinforce understanding of Python data structures and flow control.
- **Day 2**: Learn about Python modules and packages, structuring code.
- **Day 3**: Learn about good coding practices, including clean, readable code and proper documentation.
- **Day 4**: Review list and dictionary comprehensions, read about Python testing.

## Quest Brief

Your team will develop the "Escape Room" game. Implement Python code, manage errors, and test your game to ensure robustness. Each room presents unique challenges. The goal is to escape from the starting room (Game Room) to the end (Outside). Look at the image below and read the game narrative to understand the game logic fully:

![Room Layout](https://raw.githubusercontent.com/ta-data-lis/python-project/master/escape-room-plan.jpg)

### Game Narrative

Suddenly, you find yourself waking up on an unfamiliar couch, in an eerie house devoid of windows. Your memory fails to provide any explanation about how you ended up here, or what transpired previously. You can sense an imminent threat lurking somewhere - your gut tells you to escape the house immediately!

You look around and realize you're in a game room.

"What should I do?" you ponder.

You decide to explore the room, which uncovers a couch, a piano, and a locked Door A. The couch appears mundane and unexciting. However, examining the piano rewards you with a key for Door A. With the newfound key, you manage to unlock Door A.

Will you step into the unknown through Door A?

#### Bedroom 1

You step into Bedroom 1.

Again, you find yourself contemplating - to explore or examine?

Your exploration reveals a queen bed, Doors A, B, and C. Underneath the queen bed, you find a key for Door B. Door C remains an impenetrable barrier as it's locked and you lack the key. But with the key you found under the bed, you manage to unlock Door B.

Is it time to venture through Door B?

#### Bedroom 2

Your journey leads you to Bedroom 2.

"What now?" you think.

A thorough exploration uncovers a double bed, a dresser, and Door B. Hidden in the double bed, you discover a key for Door C, and within the dresser, a key for Door D awaits. Equipped with the key for Door B, you decide to unlock it.

Shall you retrace your steps through Door B?

#### Bedroom 1

Once again, you find yourself in Bedroom 1.

"What's the next move?" you wonder.

With the key for Door C in your possession, you manage to unlock it.

Are you ready to brave the unknown behind Door C?

#### Living Room

Stepping through Door C, you find yourself in the living room.

"What secrets does this room hold?" you muse.

Exploration reveals a dining table, Door C, and Door D. With the key for Door D in your grasp, you unlock it.

Is it time to step through Door D and see what lies beyond?

#### Outside

Freedom! You've managed to escape the room! Congrats on your successful adventure! Now, can you recount the thrilling journey and the clever strategy that got you here?

## Team Collaboration

For this project, we're using Google Colab for collaborative work. It's user-friendly, perfect for team projects, and lets you focus on Python concepts. As you progress through the bootcamp, you'll transition to Jupyter Notebooks and GitHub, which is standard in the industry. Some Google Colab tips to get started are:

- **Communication:** Keep your team informed about changes.
- **Working on the Same Cell:** Avoid simultaneous cell editing.
- **Saving Your Work:** Save your work manually frequently.
- **Refreshing:** Refresh your browser if changes aren't showing.
- **Version History:** Access through `File > Revision history`.
- **Sharing:** Click `Share` to give teammates access.

## Deliverables

### The Game

Deliver a `main.ipynb` file with your Python game solution and the `.py` file(s) containing your functions. It should reflect the Python concepts learned each day and be pushed to GitHub. You may download the files from the Google Colab and push these. The end product should be fully functional but also well-structured, efficient, robust, and entertaining!

Here is a checklist of deliverables for the quest that you can refer to throughout the week to make sure you are on track:

- The game incorporates various data structures, specifically dictionaries and lists, to define game rooms, paths, and items.
- The game uses a Python dictionary to store the game state which is updated when progress is made, such as a key being collected.
- Flow control (if, elif, else statements) has been utilized to create game logic, for example, to determine what happens when a player makes certain choices or interacts with game items.
- The code appropriately uses loops where needed, such as for repeating game actions until the player reaches a certain outcome.
- The game uses functions to play the game and compartmentalize tasks such as navigating between rooms or interacting with items.
- Arguments are used in functions where appropriate to allow for reusability.
- The game uses return statements in functions to output certain results, which are then used elsewhere in your code.
- After completing each game action, functions are called to continue playing until the winning condition is reached.
- The game utilizes comprehension for creating more efficient and readable code where applicable.
- Any user input is validated and the game incorporates error handling techniques to handle any possible errors or exceptions, providing a smoother user experience.
- The code is well-documented with comments explaining what different sections of the code are doing. Functions are properly documented as well following *docstring* good practices.
- The game has a clear end goal or "win" condition that the player can achieve (making it “Outside”).

### Additional Game Features (Optional)

If you want to go above and beyond the basics, as optional extra features,here are some ideas of improvements for your project. You can also find some recommended reading to get started:

- Apply proper error handling try-except-finally blocks to handle user input or other errors.
- Args and kwargs: Update the functions to accept **`*args`** and **`**kwargs`** parameters. Modify the function calls to pass the required arguments using **`*args`** and **`**kwargs`**.
    - [Python args and kwargs: Demystified](https://realpython.com/python-kwargs-and-args/)
- Zip and unzip: Implement the use of **`zip`** to iterate over two or more iterables simultaneously, such as iterating over items and their corresponding keys.
    - [Zipping and Unzipping Iterables in Python](https://towardsdatascience.com/zip-function-in-python-da91c248385d)
- Regex: Incorporate regex patterns to validate user input for actions.
    - [Regular Expressions: Regexes in Python](https://realpython.com/regex-python/)
- Apply OOP: Refactor the code into classes to encapsulate the game logic, map, and state.

### The Presentation

You will present your game on Friday morning to the class showcasing how your game works as well as a short presentation in the form of some slides. The format of the presentation will be as follows:

- Talking with Slides: **3 minutes**
- Demo: **2 minutes**
- Total: **5 minutes**

All presentations will be done **from a staff member’s computer**, so **your slides need to be online**. PowerPoint files, Keynote files or files of any kind **will not be accepted**.

- Suggested online slide applications:
    - [Google Slides](https://www.google.com/slides/about/)
    - [Slides](https://slides.com/)
    - [Prezi](https://prezi.com/)


### Presentation Structure

Feel free to present the game in as you feel best represents your work, but below you will find a suggested format for the presentation as a guide.

1. **Title Slide** (1 slide): your project’s name & your names
2. **Project Overview** (1-2 slides):
    - How is the game’s structure organised?
    - Which functions do you have and how are they imported?
    - Which features did you add to the game?
3. **Technical Challenge** (1-2 slides):
    - What was **the most important** technical challenge you faced?
    - How did you overcome that challenge?
4. **Big Mistake** (1-2 slides):
    - What was **the biggest** mistake you made during this project?
    - What did you learn from it?
5. **Demo Slide** (1 slide): literally says “DEMO” with **a link** to your project so you can open it easily
6. **Closing Slide** (1 slide): your project’s name, your name & a *“Thank You”*
7. **Total**: 6-8 slides
