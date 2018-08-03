# Wikipedia_Facebook_Chatbot

This project is a Facebook Messenger Bot which can be used to fetch Wikipedia articles and Featured contents(Article of the day, Image of the day, new, On this day) from Wikipedia.

## Overview
This Bot provides the following,
- Wikipedia articles 
- Featured article
- Image of the day
- News
- On this day
- Most read contents

## Requirements
- Ruby
- MySQL Database
- Online hosting server (AWS, Heroku, Google Cloud or any other hosting server)
- Wit Project (For Natural Language Processing)

## Getting Started
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

## Migrate Database
First, you'll need to migrate the database tables
```
rake db:migrate
```

## Deploying your app:

#### Test your project locally
Download [ngrok](https://ngrok.com) in your local system.
Navigate to the project folder.
run `rackup -p <port_number>` inside your project folder.
run `<path_of_ngrok_file> http <port_number>`
copy the URL with 'https://' prefix. This is your webhook URL that serves your program.


#### Deploying with Heroku:
You need to have Heroku CLI installed to deploy the bot in Heroku. To find more details about Heroku CLI, [click here](https://devcenter.heroku.com/articles/heroku-cli).

You can follow [this link](https://devcenter.heroku.com/articles/git) to setup the Heroku environment for the project.

For this project, you need the following resources in your Heroku project,
- ClearDB MySQL :: Database
- Heroku Scheduler


I will update the instructions for deploying the app in AWS, Google Cloud and Microsoft Azure shortly.

## Create App in Facebook
- Goto [developers.facebook.com](https://developers.facebook.com.)
- Login using your Facebook account username and password.
- Select 'Add New App' under 'My Apps' section.
- Give a suitable name for you bot and click submit.
- Click 'set up' in Messenger product. Within the Messenger product, Select the page you want to add this chatbot and setup webhook.

### Add webhook URL to your Facebook App
In https://developers.facebook.com, Navigate to your app's dashboard and click 'webhook' under products section.
Click 'Edit subscription' button and Paste the Webhook URL over there. 
*Note* Don't forget to append '/webhook' after the URL (since config.ru file mapped to the path '/webhook').
```
https://<YOUR_URL>>/webhook
```
Or you can modify your config.ru file in your project to map whatever URL path you want.

## Contribute
#### Simple 3 step to contribute to this repo:
1. Fork the project.
2. Make required changes and commit.
3. Generate a pull request. Mention all the required description regarding the changes you have made.

## Author 
#### Balaji Ramasubramanian

If you need any help in customizing and deploying this project, email me @ balaji030698@gmail.com



