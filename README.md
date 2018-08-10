# Fitness Tracker
![Workouts](/public/workouts.png)

![Homepage](/public/homepage.png)

![Exercises](/public/exercises.png)
## Application Description

Thanks for checking out my Fitness Tracker application. This is an application centered around building a library of your favorite exercises, and being able to record each workout you accomplish using those exercises. All exercises in the library are viewable by guests, but once a user logs in they are able to create their own exercises and update or delete any one that they have created. Users are even able to embed youtube videos of their exercies into the library.

Once there are exercises in the library, users can use those exercises to log workouts against them! They can record things such as the date accomplished, sets, repitions, tempo, and how much rest between sets. The workouts that users record are grouped by date so theat they can quickly review their workout history by date.

This app is at MVP for creating exercises and logging workouts against them, but keep checking back for updates. Many more exciting features are planned!

## Repositories and links

Here are the links to all respositories and live links for this project:

### Fitness Tracker client
#### Repository:
* <https://github.com/DanNissen/fitness-tracker-client>

#### Live Link:
* <https://dannissen.github.io/fitness-tracker-client/>

### Fitness Tracker API
#### Repository:
* <https://github.com/DanNissen/fitness-tracker-rails-api>

#### Live Link:
* <https://fitness-tracker-rails-api.herokuapp.com/>

## Technologies

This project required the use of several different technologies. I will break the, out by client and API for readability.

### Client Technologies
  * JavaScript
  * HTML
  * CSS
  * jQuery
  * npm
  * SCSS
  * Ajax
  * Handlebars

### API Technologies
  * Ruby on Rails
  * PostgreSQL
  * Heroku

## Unsolved Problems - Future Features

One of the highest priority features is to add a direct video upload so that users can upload their own content instead of relying on YouTube for content. They can upload to YouTube and then post the video here, but it would be best for directly uploads that get stored in S3. Another highly desireable feature is to allow users to build multi-day and multi-pahse plans that can be stored in a plans library. Finally, another planned feature is to add an admin role that can add plans for users, edit or delete any exercise, and better manage all content on the site.

## Planning Process

Planning started out by drawing wireframes, ERDs, and user stories for the project. Because the data is highly relational, I knew I wanted to use a relational database such as PostgreSQL. Initially, I was going to use Node.js and Express.js to build out the API with PostgreSQL, but I ended up going with Ruby on Rails because I had more familiarity with it. I would like to transition the api in future iterations.

The problem-solving strategy was very methodical, building out features from start to finish and then moving on to the next. If I ran into any issues along the way I would first look at documentation and stack overflow, and if i could not resolve it I would post my question in the project issue queue. Overall, it was very effective for building out the project.

## Wireframes, ERDs, & User Stories

Wireframes, ERDs, and User Stories are posted on imgur. <https://imgur.com/a/1e1ZwQU>

The ERDs depict a future version of the app beyond MVP. The current databse structure is depicted here <https://imgur.com/vuQavIH>

## Set up and Installation

### client
If you wish to setup the application locally, it is very simple. First, fork the client repository and clone it to your local machine. Next run `npm install` to install dependencies. Go into `assets/scripts/config.js` to make sure the urls for the deployed and development versions are correct. Run `grunt serve` from the command line to get the local client running on localhost:7165.

### API
If you wish to setup the application locally, it is very simple. First, fork the api repository and clone it to your local machine. Run `bundle install` to install dependencies. Next run `bin/rails server` to run the rails server on localhost:4147.

## API Routes & Methods
All requests should be sent to this url. The path extension will be detialed below. NOTE: If a workout has been created off of an exercise it can no longer be deleted.

<https://fitness-tracker-rails-api.herokuapp.com>
### Exercises
#### Index
```
Request
    - Verb: GET
    - path: /exercises
    - Body: n/a
Response
    - Status: 200, OK
    - Body
    {
  "exercises": [
      {
          "id": 2,
          "name": "Squat",
          "description": "With bar on back, squat down and then return to standing",
          "link": "https://www.youtube.com/embed/cgIDmHfZ1aI",
          "user": {
              "id": 1,
              "email": "homer@simpsons.com"
          }
      }
  ]
}
The response body will be an exercises object that contains an array of all of
the different exercises.
```
#### Show
```
Request
    - Verb: GET
    - path: /exercises/:id
    - Body: n/a
Response
    - Status: 200, OK
    - Body
    {
  "exercise":
      {
          "id": 2,
          "name": "Squat",
          "description": "With bar on back, squat down and then return to standing",
          "link": "https://www.youtube.com/embed/cgIDmHfZ1aI",
          "user": {
              "id": 1,
              "email": "homer@simpsons.com"
          }
      }
}
The response body will be an exercises object.
```
#### Create
```
Request
    - Verb: POST
    - path: /exercises
    - headers:
      - Content Type: application/json
      - Authorization: Token token=<user_token>
    - Body:
    {
    "exercise": {
      "name": "bench press",
      "description": "push the bar away from chest",
      "link": "https://www.youtube.com/watch?v=XSza8hVTlmM"
    }
  }
Response
    - Status: 201, created
    - Body:
    {
        "exercise": {
            "id": 6,
            "name": "bench press",
            "description": "push the bar away from chest",
            "link": "https://www.youtube.com/watch?v=XSza8hVTlmM",
            "user": {
                "id": 1,
                "email": "homer@simpsons.com"
            }
        }
    }

The response body will be an exercises object.
```
#### Update
```
Request
    - Verb: PATCH
    - path: /exercises/:id
    - headers:
      - Content Type: application/json
      - Authorization: Token token=<user_token>
    - Body:
    {
    "exercise": {
      "name": "bench press",
      "description": "push the bar away from chest",
      "link": "https://www.youtube.com/watch?v=XSza8hVTlmM"
    }
  }
Response
    - Status: 200, ok
    - Body:
    {
        "exercise": {
            "id": 6,
            "name": "bench press",
            "description": "push the bar away from chest",
            "link": "https://www.youtube.com/watch?v=XSza8hVTlmM",
            "user": {
                "id": 1,
                "email": "homer@simpsons.com"
            }
        }
    }

The response body will be an exercises object.
```
#### Destroy
```
Request
    - Verb: Delete
    - path: /exercises/:id
    - headers:
      - Authorization: Token token=<user_token>
Response
    - Status: 204, no content
```

### Workouts
#### Index
```
Request
    - Verb: GET
    - path: /workouts
    - headers:
      - Authorization: Token token=<user_token>
    - Body: n/a
Response
    - Status: 200, OK
    - Body
    {
    "2018-08-09": [
        {
            "id": 2,
            "exercise_id": 2,
            "user_id": 1,
            "date": "2018-08-09",
            "sets": 3,
            "reps": 5,
            "rest_in_seconds": 120,
            "tempo": "slow",
            "created_at": "2018-08-09T22:01:06.424Z",
            "updated_at": "2018-08-09T22:01:06.424Z",
            "exercise": {
                "id": 2,
                "name": "bench press",
                "description": "push the bar away from chest",
                "link": "https://www.youtube.com/watch?v=XSza8hVTlmM",
                "created_at": "2018-08-09T20:09:39.728Z",
                "updated_at": "2018-08-10T00:38:12.703Z",
                "user_id": 1
            }
        }
    ]
  }
The response body will be an workouts object that contains keys of dates and values of arrays of all of
the different workouts.
```

#### Create
```
Request
    - Verb: POST
    - path: /workouts
    - headers:
      - Content Type: application/json
      - Authorization: Token token=<user_token>
    - Body:
    {
    "workout": {
      "exercise_id": "2",
      "user_id": "1",
      "date": "2018-08-08",
      "sets": "5",
      "reps": "12",
      "rest_in_seconds": "60",
      "tempo": "fast"
    }
  }
Response
    - Status: 201, created
    - Body:
    {
    "workout": {
        "id": 5,
        "date": "2018-08-08",
        "sets": 5,
        "reps": 12,
        "rest_in_seconds": 60,
        "tempo": "fast",
        "exercise": {
            "id": 2,
            "name": "bench press",
            "description": "push the bar away from chest",
            "link": "https://www.youtube.com/watch?v=XSza8hVTlmM"
        },
        "user": {
            "id": 1,
            "email": "homer@simpsons.com"
        }
    }
}
The response body will be an workouts object.
```
#### Update
```
Request
    - Verb: PATCH
    - path: /workouts/:id
    - headers:
      - Content Type: application/json
      - Authorization: Token token=<user_token>
    - Body:
    {
    "workout": {
      "exercise_id": "2",
      "user_id": "1",
      "date": "2018-08-08",
      "sets": "5",
      "reps": "12",
      "rest_in_seconds": "60",
      "tempo": "fast"
    }
  }
Response
    - Status: 200, ok
    - Body:
    {
    "workout": {
        "id": 3,
        "date": "2018-08-08",
        "sets": 5,
        "reps": 12,
        "rest_in_seconds": 60,
        "tempo": "fast",
        "exercise": {
            "id": 2,
            "name": "bench press",
            "description": "push the bar away from chest",
            "link": "https://www.youtube.com/watch?v=XSza8hVTlmM"
        },
        "user": {
            "id": 1,
            "email": "homer@simpsons.com"
        }
    }
}
The response body will be an workouts object.
```
#### Destroy
```
Request
    - Verb: Delete
    - path: /workouts/:id
    - headers:
      - Authorization: Token token=<user_token>
Response
    - Status: 204, no content
```
