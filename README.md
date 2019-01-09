# README

- Ruby version: 2.4.4
- Rails version: 5.0.7
- database: MySQL
    - local database
- Configuration: 
    - Need to configure database. 
    - Need to run migrations.

This is a Ruby on Rails application that keeps track of courses and sections for a university. A course has many sections, and a section belongs to a single course. Sections have many students and students have many sections. 

Course data should include the following.
- Name
- Department
- Number
- Credit hours

Section data should include the following.
- Semester
- Number
- Course
- Room number
The form for a section has a drop-down with a list of possible courses.

There are validations for all the models. 
There is a search in each index function. 
There is a navigation bar using URL helpers.
Used devise gem for authentication. 
