# Mario's Products

#### _Lee Pedersen_

### **Note to grader**

* _Admin account is name 'admin' and password 'admin'_
* _Database is named 'mario_products_development'_

## Description

_This is a site for a restaurant to keep track of its products and reviews with full CRUD functionality_

## Versions:
* _Rails 5.2.4.1_
* _Ruby 2.5.1_

## Known Bugs
_If a user's settings are changed so that they are admins, their password becomes nothing. I don't know why this is happening_

## Setup
* _Make sure you have ruby, rails, and postgres installed_
* _Clone to machine_
* _Bundle_
* _Recreate database by running these commands from the root directory of the project: `createdb mario_products_development`, `psql mario_products_development < mario_backup.sql`, `createdb -T mario_products_development mario_products_development_tests`_
* _Run `rake db:migrate`_
* _Run `rails s` from the command line_
* _Open `localhost:3000` in browser_

## Support and Contact Details
_For issues contact support@leepedersen.com_

## Technologies Used
* ruby
* git
* postgres
* SQL
* rails
* css
* html

### License
*This software is licensed under the MIT license.*

Copyright (c) 2020 **_Lee Pedersen_**
