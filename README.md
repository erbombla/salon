# _Hair Salon_

#### Web app for a hair salon
#### Dec. 08,2016

#### By **Eric Bomblatus**

## User Stories

_As a salon owner:_

* View, add, update and delete stylists
* View, add, update and delete clients
* Add clients to a stylist

_Additional Requirements_

Please use the following names for your databases:

  * Production Database: hair_salon
  * Development Database: hair_salon_test
  * Resource names will be clients and stylists

## Database Setup/Installation Instructions

```
psql (9.5.5)
Type "help" for help.

user=# CREATE DATABASE hair_salon;
CREATE DATABASE
user=# \c hair_salon
You are now connected to database "hair_salon" as user "user".
hair_salon-# CREATE TABLE stylists (ID serial PRIMARY KEY, first_name varchar, last_name varchar);
CREATE TABLE
hair_salon=# CREATE TABLE clients (ID serial PRIMARY KEY, client_first_name varchar, client_last_name varchar, stylist_id int);
CREATE TABLE
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
CREATE DATABASE

```

## Known Bugs

## Support & Contact

If you run into any issues or have questions, ideas or concerns you may contact me at ebomblatus@gmail.com. Thank you.

## Technologies Used

* Postgres
* Ruby
* Sinatra
* Rspec
* Bootstrap

### License

MIT License

Copyright (c) 2016 **Eric Bomblatus**
