<!-- Learn to code, not “No (AI cheat) code (DA)” -->

## Learning Goals

By the end of this lesson, you will be able to:

- Utilize the Ironhack ChatBot as a tool to enhance your learning process rather than a means of completing exercises
- Apply the knowledge of how to effectively craft prompts to extract beneficial guidance from the Ironhack ChatBot, not just direct solutions
- Evaluate a given problem or learning need you have and determine how to structure a prompt for the Ironhack ChatBot that will maximize its value for you
- Critically assess the feedback or guidance given by the Ironhack ChatBot and incorporate it into your learning process
- Construct and refine your own prompts to explore topics, clarify code, seek lab support, and request additional activities from the Ironhack ChatBot for your personal learning goals

<br>

## Introduction

At Ironhack we place significant importance on the discovery of innovative learning tools for our students. One such tool that has made a significant impact is ChatGPT, developed by OpenAI. However, as with any new powerful resource, it's crucial to use it wisely and understand it. Within the bootcamp, the temptation to use ChatGPT as a means to solve problems, therefore bypassing the critical learning and understanding process, might be high at times. The bootcamp is intense and requires a lot of time to go through materials and solve labs.

The aim of this lesson is to guide you on how to **leverage the Ironhack ChatBot (an adapted version of ChatGPT) as an aide to your learning journey in web development, not a shortcut**. There will be specific use cases that highlight the utility of the Ironhack ChatBot while also emphasizing its responsible and beneficial use.

<br>

## Accessing the Ironhack ChatBot

In order to access the Ironhack ChatBot, click this link:

- [Ironhack ChatBot](https://companion.ironhack.com/)

In the following sections you will learn how to use the Ironhack ChatBot for support.

But first, let’s take a look at some of the Ironhack ChatBot’s key features in the video and guide below:

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/cd611f7f3e314045a64a3981555b6081" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

<br>

<iframe src="https://scribehow.com/embed/Ironhack_ChatBot_Features__XpZPR8aqQdCfmmgnhLpiPw" width="100%" height="640" allowfullscreen frameborder="0"></iframe>

<br>

## Ironhack ChatBot as a Learning Tool

The Ironhack ChatBot, with its capabilities, can be an invaluable asset when used in certain ways. It can help clarify complex concepts, support learning through interactive dialogue, provide feedback, and even generate additional learning materials for you. However, the key to harnessing its potential lies in understanding its role - it is a tool for learning, not an easy way out to solve exercises.

Using the Ironhack ChatBot to instantly solve exercises or complete labs might seem efficient initially, but in reality, it will greatly hinder your learning process. Genuine understanding and skill-building occur when you grapple with problems, make mistakes, and subsequently learn from them. Relying on the Ironhack ChatBot to do the heavy lifting doesn't cultivate these important and critical skills you will need after the bootcamp to get a job.

One way to think about the Ironhack ChatBot is as a learning companion. Use it to explore topics in depth, gain different perspectives, or clarify doubts. Ask it to explain code snippets or concepts you're struggling with. Utilize it as a tool for self-assessment or for generating additional practice activities. By employing the Ironhack ChatBot in these ways, you're enhancing your learning experience, not bypassing it. In the next section you will see some examples of how you can create the prompts to aid your learning and utilize it in the bootcamp.

<br>

## Use Cases

These examples serve as practical examples and use cases for how you might want to use the Ironhack ChatBot to help you learning. In each example there is a scenario to provide some context, and example prompt, the output of this prompt and in some cases follow-up prompts that could be asked to continue the conversation with the Ironhack ChatBot.

<br>

### Example 1: Exploring a Topic in More Detail

**Scenario:**

- You have just been introduced to Python data structures, such as lists and dictionaries. You understand their basic principles but want to delve deeper into their functionalities and use cases.

<br>

**Example prompt:**

- I am a beginner learning Data Analytics in the second week of a bootcamp. Can you explain in more detail about lists and dictionaries in Python and how to use them?

<br>

<details>
  <summary style="font-size: 16px"><b>Output</b></summary>

Sure, I'd be happy to explain.
    
A **list** in Python is an ordered collection of items. The items in a list are not required to be of the same type. Lists are mutable, which means that the contents of a list can be changed after it's been created. You can create a list by placing comma-separated values inside square brackets **`[]`**. For example:
    
```python

fruits = ['apple', 'banana', 'cherry']
print(fruits)  # Output: ['apple', 'banana', 'cherry']

```
    
A **dictionary** on the other hand, is an unordered collection of items. Each item in a dictionary is a pair of a key and a value. You can use the key to access the corresponding value. Dictionaries are also mutable. They are defined by using curly braces **`{}`** with key-value pairs separated by colons. For example:
    
```python

fruit_colors = {'apple': 'red', 'banana': 'yellow', 'cherry': 'red'}
print(fruit_colors)  # Output: {'apple': 'red', 'banana': 'yellow', 'cherry': 'red'}

```
    
So in a nutshell, you would use lists when order matters and when items may be repeated. On the other hand, dictionaries are used when you need a logical association between a key and a value, and no duplication or ordering of these keys.

<br>

</details>

<br>

### Example 2: Explaining code snippets

**Scenario:**

- You're working on Python exercises and come across a function that takes a list of numbers as a parameter and sums them up. You're familiar with the basics but are having trouble understanding how this function operates.

<br>

**Example prompt:**

- I am working on a Python exercise about functions and I'm having trouble understanding one. When there's a for loop involved I struggle to understand how the function works fully. Can you explain how it works in detail in terms a beginner would understand? Here's the function:

```python

def calculateSum(numbers):
  total = 0
  for num in numbers:
    total += num
  return total

```

<br>

<details>
  <summary style="font-size: 16px"><b>Output</b></summary>

Sure, I'd be happy to explain this.

This function, **`calculateSum(numbers)`**, takes a list of numbers as its input and calculates the sum of these numbers.

It starts by initializing a variable **`total`** to 0. This will be used to keep track of the running total of the numbers in the list.

The function then begins a **`for`** loop that goes through each number (**`num`**) in the provided list (**`numbers`**). For each **`num`**, it adds that number to the current **`total`**. This **`+=`** operator is a shorthand for **`total = total + num`**.

After the loop has gone through all the numbers in the list, the function returns the **`total`**, which is the sum of all the numbers in the list.

For example, if the input list is **`[1, 2, 3, 4, 5]`**, the function will return **`1+2+3+4+5 = 15`**.

<br>

</details>

<br>

### Example 3: Additional activities

**Scenario:**

- You have completed the check for understanding activities in the portal and maybe even the relevant lab as well. You want more practice as you want to build confidence in understanding flow control in Python.

<br>

**Example prompt:**

- I have recently completed the check for understanding activities and the lab exercises related to flow control in Python in my bootcamp course. I understand the basic concepts of conditional statements (if, else, elif) and loops (for, while). However, I'm finding these topics quite challenging and would like to have more practice to consolidate my learning. Could you provide some additional activities and exercises that I can work on? I'm particularly interested in the following topics:
    - Using conditional statements in Python.
    - Writing and using **`for`** and **`while`** loops in Python.
    - Working with **`break`** and **`continue`** statements in Python.
- I would appreciate if these activities and exercises could range from beginner to intermediate level, as I feel this would best help me to reinforce my understanding and gain confidence. Thanks!

<br>

<details>
  <summary style="font-size: 16px"><b>Output</b></summary>

Sure, I'd be happy to provide some exercises:

1. **Conditional statements:** Write a Python program that takes an integer from the user and prints whether the number is even or odd.
2. **For Loops:** Write a Python program that prints the multiplication table of a given number (from 1 to 10).
3. **While Loops:** Write a Python program that asks the user to input numbers until the user inputs the number 0, then print the sum of all the numbers entered.
4. **Break and Continue:** Modify the previous exercise. If the user inputs a negative number, don't add it to the sum, but don't stop the loop. If the user inputs the number -1, stop the loop without adding -1 to the sum.

Remember to test your code and understand how it works. If you encounter any errors, try to understand the error message and how you might resolve it. Happy coding!

<br>

</details>

<br>

## Support for Labs

One other use case where the Ironhack ChatBot could prove very useful is help with labs. However, as mentioned previously there might be temptation to use the Ironhack ChatBot to solve the lab for you to save time if you are stuck. This will not help your learning, and hinder your long term progress and success as a developer as previously discussed.

The Ironhack ChatBot is **very** eager to solve problems with minimal prompting, so it is key to be very precise and descriptive when using it for help with labs. In this example pay close attention to how the prompt is worded so that **answers are not provided**, and you are still able to actually write code yourself and apply knowledge from lessons.

Some tips for creating prompts to help you receive support rather than answers include:

- Explicitly stating to the Ironhack ChatBot that you do not want it to write code or solve your problem
- Asking the Ironhack ChatBot for hints/tips
- Checking your thought process with the Ironhack ChatBot
- Asking the Ironhack ChatBot for topics that you should explore further to help you solve the lab
    
## Data Privacy & Research

Please be advised that all prompts and interactions you have with the Ironhack ChatBot will be recorded and saved. These records serve an important function: they contribute to ongoing internal educational research on how the tool is being used and how to improve the experience. Importantly, any data collected in this manner will strictly be used for educational purposes within the scope of Ironhack and will not be shared with external parties.

## Summary

In this lesson, you have seen the application of the Ironhack ChatBot as a learning tool, demonstrating its capacity to break down complex topics, explain code snippets, guide lab exercises, and propose additional activities for practice. Through exploring different use cases that highlight the importance of focusing on the learning process rather than simply seeking solutions you should have some inspiration for you to utilize the Ironhack ChatBot in the bootcamp if you chose to do so.

From deepening understanding of Object-Oriented Programming, to demystifying JavaScript code, offering structured guidance and hints for lab tasks, providing constructive feedback on lab solutions, and recommending extra exercises for reinforcing knowledge, the Ironhack ChatBot can act as an adaptable, interactive, and comprehensive educational resource that can form part of your learning journey, not a “no-code” tool.

A key aspect of this approach is the art of crafting thoughtful prompts that encourage critical thinking and active problem-solving. This will take lots of practice, and the examples in this lesson serve as a starting point. Also remember that the Ironhack ChatBot is just another resource at your disposal along with your lead teacher, TA, peers and the wealth of information online (Google, YouTube, Stack Overflow) for you to learn from.