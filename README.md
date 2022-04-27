# README

# Lunch Scheduler

# Challenge:
Every Friday the employees are grouped to have lunch together in order to get to know each other better. The  team
has grown a lot in the past months, so it is hard to follow-up with groups, restaurants, etc.

For this reason, we would like you to create a Rails application where we can automate the generation of the groups.
Each group should have a leader that will choose a restaurant. We would like to avoid having same leaders each week.
The groups should be of equal size (+/- 1 person) and employees of the same unit (e.g. HR, IT) should be spread as much as possible in the
different groups.

Every week, new groups are supposed to be different than in the previous weeks.
The app should ask all DG employees if they want to go out for lunch. After collecting responses, the groups and leaders should be
generated and notified.
The leaders can choose a restaurant and share it with their group.
• You can choose a way of asking/notifying users;
• Try to follow all the steps as much as you can, but if you are not able to finish something, or do not know how, do not worry. We
would appreciate explanation of the issue.
• Be creative! If you can add some easy feature that might help us, feel free to add it and write a short explanation.
Set up a private Git repository, git bundle it and share it with us in a zip file.

Expectations:
Minimum Expectations:
• 4 models (Employees, Teams, MappingEmployeeTeams (join table), BlindDates to store the output for each week)
• 1 BlindDates controller & 1 BlindDates helper
• 2 routes (“get” to display the index of employees and maybe last week’s blind dates, “post” to generate the new blinddates)
• 1 view
• Seeds to generate the employees, the teams and their mapping
• Foreign keys
• Code styling (naming conventions, indentation…)
• Implement functionality to add employees or assign them to a new team
• Validations (Two employees can’t be mapped twice to the same team, BlindDates can’t output twice the same list..)



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
