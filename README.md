# Tzaker
txaker is a backend for creating and handling concerts and booking. It was created using Ruby on Rails and provides a back-end API for managing companies, concerts, singers, tikits, users, and venues.

Installation

In order to run this project you need:

1- ruby
2- rails
3- postgresql
4- capybara

### Setup
Clone this repository to your desired folder:

1- ruby v 3.1.3
2- rails

## Install

Install this project with:

### Usage

To run the project, execute the following command:

> 1 - bundle install

> 2 - rails db:create db:migrate

> 3 - rails s
 
> 4 -user "http://localhost:3000/" to comunicate with the server

here are the end-points

Endpoint  | Method | Description | ex
------------- | ------------- | ------------- | -------------
/users/signup  | POST | Create a user and get a token |  {  "user": {    "name": "user",    "email": "eldeeb@gmail.com",    "password": "123456789",    "name": "mohamed eldeeb",    "img_url": "ex.png"  }}
/users/login  | POST | Give the email and password will login and return the user token |  {  "user": {    "name": "user",    "email": "eldeeb@gmail.com",    "password": "123456789"  }}
/users/logout  | DELETE | Change the user token in database |  {"user": {"name": "user","email": "eldeeb@gmail.com","password": "123456789",}}
/companies/signup  | POST | Create a company and get a token | {"company": {"name": "company","email":company@gmail.com","password": "123456789""name": "mohamed eldeeb","img_url": "ex.png","location":cairo","bio": "the best"}}
/companies/login  | POST | Give the email and password will login and return the company token | {"company": {"email": "company@gmail.com","password": "123456789"}}
/companies/logout  | DELETE | Change the compnay token in database | {"company": {"email": "company@gmail.com","password": "123456789"}}
/singers/signup  | POST | Create a singer and get a token | {"singer": {"name": "singer","email": "singer@gmail.com","password": "123456789", "name": "ali", "img_url": "ex.png", "music_genre": "rap", "bio": "the best"}}
/singers/login  | POST | Give the email and password will login and return the singer token | {"singer": {"name": "singer","email": "singer@gmail.com","password": "123456789"}}
/singers/logout  | DELETE | Change the compnay token in database | {"singer": {"name": "singer","email": "singer@gmail.com","password": "123456789"}}
/venues  | POST | Create a venue NOTE: the company token must be included | {"venue": {"platinum_seats_count": 1,"gold_seats_count": 1,"silver_seats_count": 1,"location": "cairo", "location": "cairo"}}
/concerts  | POST | Create the concert but NOTE: if the compnay key is included the status of the concert will be "pinded_by company" till the user accept or reject and vice versa. | {"concert": {"company_id": 1,"venue_id":,"silver_seats_price": 1,"gold_seats_price": 1,"platinum_seats_price": 1,"location": "cairo", date: "23-4"}}
/concerts  | PATCH | This is for changing the status of the concert to "accepted" of "rejected" as mentioned. | {"concert": "status": "approved"}
/concerts/:id  | DELETE | Deletes the concert with the titkets NOTE: aither the singer token or the company token must be there
/tikits  | POST | This is for creating a tiket NOTE: the user token must be inclouded | {"tikit": {"concert_id": 1, "seat_type": "gold"}}
/tikits/:id  | DELETE | This is for destoring a tiket NOTE: the user token must be inclouded
/concerts/:id/tikits  | GET | This gets all tikets for a single concert NOTE: aither the singer token or the company token must be there
/concerts/:id/tikits_count  | GET | This gets all tikets count for a single concert NOTE: aither the singer token or the company token must be there
/concerts/:id/tikits_price  | GET | This gets all tikets count for a single concert NOTE: aither the singer token or the company token must be there

## yes!! there is a typing error.

> I used tikit instead of tiket

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Mohamed El-Deeb**

- GitHub: [@githubhandle](https://github.com/eng-mohamed-eldeeb)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/eng-mohamed-eldeeb/)


## ⭐️ Show your support <a name="support"></a>

