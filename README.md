# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Clone repository
   1. git clone https://github.com/cesarediaz/moviesstaff-api

* Ruby version
  1. ruby 2.4.1p111

* System dependencies
  1. should have access in your OS to a local Postgres engine to create development and test databases

* Configuration
  1. bundle install

* Database creation
  1. rails db:setup

* Database initialization
  > all in one
  1. rails db:setup
  
  > or in two steps

  1. rails db:migrate

  2. rails db:seed

* How to run the test suite
  > tests for models
  1. rspec spec/models

  > tests for api requests
  2. rspec spec/requests

  > run all tests
  3. rspec


* Where use the app:
  > Testing in localhost
  1. cd moviesstaff-api
  2. rails s
  3. execute in a bash terminal console

  ```bash
    $> curl http://0.0.0.0:3000/api/v1/people
    $> [
        {"id":58,"last_name":"Schinner","first_name":"Jonathon","aliases":"WII"},
        {"id":59,"last_name":"Donnelly","first_name":"Shan","aliases":"GSI"},
        {"id":62,"last_name":"Walter","first_name":"Lina","aliases":"UDD"}
      ]
  ```
  > This app is deployed at Heroku server in the next [link](https://moviesstaff-api.herokuapp.com/)

  > Test API in next links
  1. Movies list json [https://moviesstaff-api.herokuapp.com/api/v1/movies](https://moviesstaff-api.herokuapp.com/api/v1/movies)
  ```json
    [
      {
      "id":26,
      "title":"Here's looking at you, kid.",
      "release_year":2015
      },
      {
        "id":28,
        "title":"You talking to me?",
        "release_year":2014
      }
    ]
  ```

  2. Movie in particular json [https://moviesstaff-api.herokuapp.com/api/v1/movies/ID](https://moviesstaff-api.herokuapp.com/api/v1/movies/ID)
  > example ID = 35

  ```json
      {"movie":
        {
          "id":35,
          "title":"All right, Mr. DeMille, I'm ready for my closeup.",
          "release_year":"MCMXCII",
          "directors":[
            {
              "first_name":"Wiley",
              "last_name":"Murray",
              "aliases":"APV"
            }],
          "producers":[
            {
              "first_name":"Roosevelt",
              "last_name":"Morar",
              "aliases":"DSG"
            },
            {
              "first_name":"Fred",
              "last_name":"Koelpin",
              "aliases":"BAX"
            },
            {
              "first_name":"Etta",
              "last_name":"Wieganddd",
              "aliases":"YHU"
            }
          ],
          "casting":[
            {
              "first_name":"Verla",
              "last_name":"O'Kon",
              "aliases":"FEZ"
            },
            {
              "first_name":"Fred",
              "last_name":"Koelpin",
              "aliases":"BAX"
            }
          ]
        }
      }
  ```
  3. People list json [https://moviesstaff-api.herokuapp.com/api/v1/people](https://moviesstaff-api.herokuapp.com/api/v1/people)
  ```json
    [
      {"id":6,"last_name":"O'Kon","first_name":"Verla","aliases":"FEZ"},
      {"id":7,"last_name":"Murray","first_name":"Wiley","aliases":"APV"},
      {"id":8,"last_name":"Morar","first_name":"Roosevelt","aliases":"DSG"}
    ]
  ```
  4. People in particular json [https://moviesstaff-api.herokuapp.com/api/v1/people/ID](https://moviesstaff-api.herokuapp.com/api/v1/people/ID)
  > example ID = 6
  ```json
    {
      "person":
        {"id":6,"first_name":"Verla","last_name":"O'Kon","aliases":"FEZ"},
      "movies":
        {
          "as_director":
            [
              {"id":26,"title":"Here's looking at you, kid.","release_year":2015},
              {"id":30,"title":"Frankly, my dear, I don’t give a damn.","release_year":1997}
            ],
          "as_producer":
            [
              {"id":28,"title":"You talking to me?","release_year":2014},
              {"id":29,"title":"You talking to me?","release_year":1989},
              {"id":42,"title":"All right, Mr. DeMille, I'm ready for my closeup.","release_year":1988}
            ],
          "as_actor":
            [
              {"id":35,"title":"All right, Mr. DeMille, I'm ready for my closeup.","release_year":1992},
              {"id":27,"title":"All right, Mr. DeMille, I'm ready for my closeup.","release_year":1986}
            ]
        }
      }
  ```
