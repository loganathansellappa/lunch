# README

# Lunch Scheduler


## Available Endpoint Urls
| Feature           | URL                                   |
|-------------------|---------------------------------------|
| Lunch Scheduler   | http://localhost:3000/employees       |
| List All Groups   | http://localhost:3000/groups          |
| Create Employee   | http://localhost:3000/employees/new   |
| Create Team       | http://localhost:3000/teams/new       |
| List Teams        | http://localhost:3000/teams           |
| Create Restuarant | http://localhost:3000/restuarants/new |



## Note

> The app has been created in short span of time hence
> not all the features are implemented
>
>
- Only functional features have been implemented
- Notification are not implemented
- Restaurants are hard coded
- Tests coverage can be further improved
- Bugs are expected

## Features Added
- Employee Creation
- Generate uniq groups of people for lunch for the give friday
- View Groups

## Tech

Dillinger uses a number of open source projects to work properly:

- [Ruby] - 3.0.0
- [Rails] - 6.1
- [Database] - MySql

## Installation

Install the dependencies and devDependencies and start the server.

```sh
cd lunch
bundle
rails db:prepare RAILS_ENV=development
rails db:seed RAILS_ENV=development
rails s
```

## Run Tests
```sh
cd lunch
bundle
rails db:prepare RAILS_ENV=test
rails db:seed RAILS_ENV=test
rspec .
```
