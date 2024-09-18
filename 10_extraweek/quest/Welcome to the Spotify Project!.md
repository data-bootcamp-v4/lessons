# Welcome to the Spotify Project!

After reading the Gnod Project Introduction, you are now ready to develop the product that Jane, the CTO of Gnod, asked you to create. You will present it on Friday, where it will be live-tested to assess how good your song recommendations are!

---

## Instructions

### DAY 1:
**Objective:**
- Install necessary libraries and create a Spotify developer account (if not done).
- Create a DataFrame with the top 100 songs and respective artists by scraping the website [Billboard Hot 100](https://www.billboard.com/charts/hot-100/).
  - The DataFrame should have 2 columns: `song_title`, `artist`.
- Using the `Spotipy` library, create a DataFrame storing the `audio_features` of at least 1000 songs.
  - The more diverse your playlist, the better the end result will be!

### DAY 2:
**Objective:**
- Create a Python program that takes a user input, checks if it is present in your scraped DataFrame.
  - If it is, it recommends a random song from the DataFrame.
  - If it’s not, it prints: `Sorry, your song is not popular`.
  - *Important note*: For now, you will not use the DataFrame of audio features you created yesterday.

### DAY 3:
**Objective:**
- Using one of the Unsupervised Learning Algorithms that we have covered, create a model using the audio features DataFrame you created on Tuesday.

### DAY 4:
**Objective:**
- Finalize the project: Your final program should check if a song is present in your scraped `billboard_hot100` DataFrame.
  - If it is, it should recommend a random song from that DataFrame.
  - If not, it should recommend a song based on musical similarity.

---

Good luck!
