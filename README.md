# Wikipedia_Facebook_Chatbot
This project is a Facebook Messenger Bot which can be used to fetch Wikipedia articles and Featured contents(Article of the day, Image of the day, news, On this day) from Wikipedia.

You can see the bot in action in this [video](https://youtu.be/fTAFlR1UbQw).

## Overview
This Bot provides the following features,
- Fetch a particular article from Wikipedia
- Suggest a random article from Wikipedia
- Wikipedia Featured articles
- Image of the day
- News
- On this day
- Most read contents in Wikipedia

## How a user can use the bot?
> **Note:** This chatbot is currently in development phase, So before start using this chatbot, you need to be in the testers list of this bot. Just send an E-mail to balaji030698@gmail.com with your Facebook profile URL, I will add you to the testers list. You will get an invite notification through Facebook. After accepting the invitation, You can start using this bot.

> Once the chatbot is published, Every Facebook user can access it without requesting for the test user access.

The chatbot is currently deployed in the page https://www.facebook.com/wikipediatestbot. 

- Open the url https://www.facebook.com/wikipediatestbot.
- Click on the *GET STARTED* button to start the conversation.
- You can use the menu present in the chat to send messages quickly.
- Once you started your conversation, You will be added to bot's subscriber list. 
- The subscribed users will be getting the notification messages with featured contents of Wikipedia such as Article of the day, Image of the day, News and On this day.
- You can modify your subscriptions using *More -> My Subscriptions* option.

Sample phrases that the user can use,
- Send me the image of the day
- Send me the trending news
- Can you send me the article about Steve Jobs?
- Tell me about Bill Gates
- What are the most read articles in Wikipedia?
- Unsubscribe me from image of the day

## Multi-language support
This bot has the capability to support multiple languages. Currently, It is trained in English and Tamil. We can train the bot in other languages as well in the future.

The bot will fetch the user's language preference from their phone and Facebook account's language settings option. If the user has un-supported language, then English will be used.

[Wit.ai](https://wit.ai) is used as an NLP agent to handle user's messages. To train our bot in more languages, we need to train the Wit.ai models and add the access tokens in .env file.

# For developers

## Requirements to deploy this chatbot
- Ruby
- MySQL Database
- Online hosting server
- Wit Project (For Natural Language Processing)

## Getting started
First, you'll need to fork and clone this repo

Open Terminal. Change the current working directory to the location where you want the cloned directory to be created.

```
git clone https://github.com/Balaji-Ramasubramanian/Wikipedia_Facebook_Chatbot
```
Let's get all our dependencies setup:
```
 bundle install 
```

## Configuration
You need to change the **.env** file with your appropriate access tokens, usernames, and passwords. You need to add the following details,
- Facebook page access token
- Verify token for your Facebook app
- App secret token
- Wit access token
- Database Host
- Database Name
- Database Username
- Database Password

## Migrate database
First, you'll need to migrate the database tables
```
rake db:migrate
```

## Deploying your app:

#### Test your project locally
Download [ngrok](https://ngrok.com) in your local system.

Open terminal and navigate to the project folder

run `rackup -p <port_number>`.

Open another window in terminal 

run `<path_of_ngrok_file> http <port_number>`

copy the URL with 'https://' prefix. This is your webhook URL that serves your program.


#### Deploying with Heroku:
You need to have Heroku CLI installed to deploy the bot in Heroku. To find more details about Heroku CLI, [click here](https://devcenter.heroku.com/articles/heroku-cli).

You can follow [this link](https://devcenter.heroku.com/articles/git) to setup the Heroku environment for the project.

For this project, you need the following resources in your Heroku project,
- ClearDB MySQL :: Database
- Heroku Scheduler


I will update the instructions for deploying the app in AWS, Google Cloud and Microsoft Azure shortly.

## Create an app in Facebook
- Goto [developers.facebook.com](https://developers.facebook.com.)
- Login using your Facebook account username and password.
- Select 'Add New App' under 'My Apps' section.
- Give a suitable name for you bot and click submit.
- Click 'set up' in Messenger product. Within the Messenger product, Select the page you want to add this chatbot and setup webhook.

#### Add webhook URL to your Facebook App
In [developers.facebook.com](https://developers.facebook.com.), Navigate to your app's dashboard and click 'webhook' under products section.
Click 'Edit subscription' button and Paste the Webhook URL over there. 

**Note** Don't forget to append '/webhook' after the URL (since config.ru file mapped to the path '/webhook').
```
https://<YOUR_URL>>/webhook
```
Or you can modify your config.ru file in your project to map whatever URL path you want.

## How to add test users?
### Test the app during the development phase
During the development phase, only the admins of the bot and the test users who are added by the admins are able to use the bot.
Admins of the chatbot can add more Facebook users and also add test users through their app's dashboard.

#### Add new roles to the bot
To add new roles, Navigate to the app's dashboard on [Facebook developer's page](https://developers.facebook.com/apps/1812783848743868/roles/roles/).
Click on Roles -> Roles.
In this page, we can add Facebook users to any one of the roles of admin/developer/tester/analytic user.

#### Add test users
Test Users are temporary Facebook accounts that you can create to test various features of your app.
To add test users for your app, Navigate to Roles -> Test Users and click on add/edit test user accounts.

## Publishing the app
To publish the chatbot, we need to submit our app for Facebook review.
To do that, click on App Review -> start a submission.

After publishing the app, any Facebook users can access it by directly sending messages to the corresponding Facebook page that hosts the chatbot.

## Contribute
#### Simple 3 step to contribute to this repo:
1. Fork the project.
2. Make required changes and commit.
3. Generate a pull request. Mention all the required description regarding the changes you have made.

## Author 
#### Balaji Ramasubramanian
If you need any help in customizing and deploying this project, email me @ balaji030698@gmail.com
