## Sweater Weather
Rails application that uses Service-Oriented Architecture (SOA) that provides backend framework to call multiple API's and return formatted data.  

### Licenses

  * Ruby 2.5.3
  * Rails 2.5.4.3

### Learning Goals

  * Consume multiple external APIs

    * Build API's that return JSON responses

    * Refactor code for better code for improved organization/readability

    * Utilize workflow: small commits and keep similar functionality on one branch

    * Utilize code that adheres to the four pillars of OOP

## Readme Content

- [Setup](#setup)
  - [Installation](#installation)
  - [Running the tests](#running-the-tests)
  - [API keys](#api-keys)
  - [API endpoints](#api-endpoints)
- [Author](#author)
_____

## Setup

### Prerequisites
- Ruby 2.5.3
- Rails 5.2.4.3

### Installation

```
bundle install
rails db:create
rails db:migrate
rails s (runs your serve)
```

- Now you can send requests via http://localhost:3000/
- This is an API only app (no views)
- You can also access the production API at [sweater-weather-lriff.herokuapp.com](https://sweater-weather-lriff.herokuapp.com/)

### Running Tests
- Run with $bundle exec rspec
- All tests should be passing

## API keys
https://unsplash.com/join
https://openweathermap.org/api (register for One Call API)
https://business.mapquest.com/developer-apis-sdks (For this application we will be using the geocoding api)

## Environment Variables

Run figaro install
  - this command will create the file application.yml
  - add all keys to this file
      - i.e MAPS_API_KEY: <your-api-key>

### API Endpoints

- Background image for a city <br>
- User registration and login
- Route including travel time <br>
- Current weather <br>
- Weather at time of arrival <br>

## Author
- Vanessa Arruda | [github](https://github.com/nessaarruda) | [linkedin](https://www.linkedin.com/in/vanessa-alves-de-arruda/)
