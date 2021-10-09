# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Follow this instruction to install and running application :
- rvm install 2.5.1
- rvm use 2.5.1

 * make sure you were in directory reservation_api folder
- gem install bundler
- bundle install
- rails db:create
- rails db:migrate
- rails server

application will running in port 3000
access with url -> localhost:3000/ in your browser
make sure the browser has display the page include "Yay! You’re on Rails!"
and the reservation_api has been ready to used


Post the Payloads using Postman 


- use method POST and url localhost:3000/reservations
- fill the body with format json 

{
    "reservation":{
    "code": "XXX123445679",
    "start_date": "2021-04-12",
    "end_date": "2021-04-16",
    "expected_payout_amount": "4200.00",
    "guest_details": {
        "localized_description": "4 guests",
        "number_of_adults": 2,
        "number_of_children": 2,
        "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
        "639123456789",
        "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
    }
} 

or

{
    "reservation_code": "YYZ122445678",
    "start_date": "2021-04-14",
    "end_date": "2021-04-18",
    "nights": 4,
    "guests": 4,
    "adults": 2,
    "children": 2,
    "infants": 0,
    "status": "accepted",
    "guest": {
        "first_name": "Wayner",
        "last_name": "Woodbridged",
        "phone": "639123456789",
        "email": "wayne_woodbridgesst@bnb.com"
    },
    "currency": "AUD",
    "payout_price": "4200.00",
    "security_price": "500",
    "total_price": "4700.00"
}

- send
and then reservation will be created with status 201 created    
and will be return with status 417 expectation_failed if failed to create reservation 

Post change reservation

- use method POST and url localhost:3000/reservations/XXX123445678
- make sure code of reservation 'XXX123445678' has been created before
- fill the body with format json 

{   
    "start_date": "2021-04-07",
    "end_date": "2021-04-09",
    "status_type": "accepted",
    "number_of_guests": 2,
    "currency": "SGD"
    
}

- send
and then reservation will be created with status 202 accepted    
and will be return with status 404 not_found if failed to create reservation 

# reservation_api
