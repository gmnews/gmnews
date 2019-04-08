# GM News

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

**GM News is an all-in-one app that wakes you up in the morning, and has your personally selected news sources ready to inform when you slip on your slippers and pour your coffee. Our user-targeted alarm clock will get you up and ready in the morning. Studies show that reading in the morning is beneficial since your mind is most susceptible to information. Also, most people tend to read longer articles early in the morning as opposed to other times throughout the day.** 

### App Evaluation

- **Category: Entertainment, News, Utilities, and Producivity**
- **Mobile: Pretty mobile, easy to use anywhere**
- **Story: This product has great value for people who want to kickstart their morning, by having important information available to them in one place.**
- **Market: The market is college students and more professional people. It's mostly for anyone who is looking to be more productive in the morning.**
- **Habit: Every day in the morning.**
- **Scope: Technically speaking, the logic running the app is not too intense. However, making it look attractive will be where our troubles will arise. A stripped down version, with only a news stream, would still be interesting. The vision we have for the product is crystal clear, and we are excited to bring it to market.**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Sign-Up/Sign-In/Log Out :heavy_check_mark:
* Add/remove news sources 
* View news sources
* View news articles :heavy_check_mark:
* Create alarms
* Turn off alarms
* Show full article when pressed
* History/saved articles

**Optional Nice-to-have Stories**

* Show full article in app
* Show weather
* Share article
* Dismiss article from main screen

### 2. Screen Archetypes

* Sign-Up/Sign-In Screen
   * User will either sign in or sign up
   * After signing in, will redirect to home screen
* Home Screen
   * User can view news
   * User can tap article to read it in full
* Profile/Settings Screen
   * User can edit news sources
* Alarm Screen
   * User can edit alarms

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Alarm
* Profile

**Flow Navigation** (Screen to Screen)

* Sign-Up/Sign-In Screen
   * Sign-In -> Home Screen
* Home Screen
   * Article -> Full news article
* Profile
   * Edit news sources button -> Edit news sources 
   * Logout -> Sign-Up/Sign-In Screen

## Wireframes
<img src="https://i.imgur.com/JuJkK7D.jpg" width=600>

## Schema 
### Models
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | username      | String   | unique id for the user |
   | password      | String   | password for the user |
   | email         | String   | user's email (used for account management) |
   | newsList      | [String] | image that user posts |
   
### Networking
#### List of network requests by screen
   - Log-In Screen
      - (Read/GET) Authenticate User
      - (Create/POST) Create User
   - News Screen
      - (Read/GET) Query news sources from user
   - Alarm Screen
      - None necesarry, since alarms are saved locally
   - Profile Screen
      - (Update/PUT) Update user profile image
      - (Read/GET) View selected/all news sources
      - (Update/PUT) Update news sources
#### [OPTIONAL:] Existing API Endpoints
##### News API
- Base URL - [https://www.newsapi.org/v2](https://www.newsapi.org)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /top-headlines | gets top headlines for a country or specific news source
    `GET`    | /sources | get major sources from provided country
