# CS 1530 - Software Engineering Term Project 
# EasyTrip 
## by: Mouhammadou Dabo, Collin Griffin, Adam Grzegorczyk, Colton Lipchak and Krutarth Patel

- EasyTrip is a web application for planning and exporting trip itineraries. 

- The EasyTrip software takes in locations the user wishes to visit and plots the order they should be visited in based on factors such as closing times, busy times, reservations, tickets, etc. 

- The software is to be used by those planning trips to different cities or other locations who hope to maximize the time they spend at each attraction. The EasyTrip software makes travel more efficient, increases the benefit the user receives from each location they visit, and ensures that the user can visit as many of their desired destinations as possible promptly

## Prerequisites

Have **Python** and **pip** installed on your host machine. 

## Instructions
To get the application running on your local machine:
- Clone this repository to your machine
- Open up your command line and navigate to the location of the directory
- Create and activate your virtual environment
  - Example on how can be found [here](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)
- Navigate to the project folder and run the commands:
```bash
pip install -r requirements.txt
flask run
```

#### Give the application some time to download the requirements. After running the command *flask run*, simply head to the address printed on the command line.

For example:
```bash
 Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

## Usage
- The main page will give you a breakdown on the features of the application.
- If this is your first time running the application:
  - Go to the sign-up page
  - Create an account by entering your name, email, and password
  - Once created, you will be redirected to your profile
- If you have used the application before and have an account, head over to the log-in page.
- The profile screen will display your upcoming trips, and also give you the opportunity to delete your account.
- The itinerary page will allow you to create, edit and delete itineraries

Once finished with the application, close your browser and press **CTRL+C** on your terminal.