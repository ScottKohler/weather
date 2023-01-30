# README

To get started with the app, first clone the repo and cd into the directory:
$ git clone https://github.com/ScottKohler/weather.git
$ cd weather

Then install the needed gems (while skipping any gems needed only in production):
$ bundle install

Next, migrate the (SQLite) database:
$ rails db:migrate

To run appliction
$ rails server

Ruby version 3.0.2p107
Rails version 6.1.7.1

http://localhost:3000/searches/new
submit a us zip code

Current conditions display name (town), humidity, temperature and windspeed
Cached Weather reports will display previous details by zip code (excluding the most recent report).  These cached records are displayed for 30 minutes

http://localhost:3000/weathers
This provides a history of all api responses, zip code and datetimes

weather api data:
"http://api.weatherapi.com/v1/current.json?key=d9f9991ee0ba4671823162624232401&q=#{params[:zip]}&aqi=no"
This can be found in SearchesController#search


Testing:
The code has been manually tested and is behaving overall.
I wanted to submit this as soon as possible, but encountered a few time consuming issues

Moving forward I will be refactoring and unit testing the code.






