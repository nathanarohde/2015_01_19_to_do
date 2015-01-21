##To-Do!
by Monty Rohde & Dex Fitch

A simple web app that lets you create multiple 'to-do' lists.

##Setup
Assuming you have ruby installed, in the terminal, navigate to the project folder and then:

`gem install bundle`

`bundle`

`ruby app.rb`

Also assuming you have postgres and psql set up on your system, create a database called:

'to_do'

Within 'to_do', paste:

'CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, due_date timestamp, list_id int);'

'CREATE TABLE lists (id serial PRIMARY KEY, name varchar);'

Go to http://localhost:4567 in your browser

Enjoy!

##Tests
Testing the ruby methods can be done via rspec.

`gem install rspec`

`rspec`

##Motivation

To practice creating a database that interacts with the front-end.

##License

MIT License, copyright 2015 dexfitch & montyrohde
