# Sweater Weather
Sweater Weather is part of a SOA web-application. Its purpose is for determining a forecast based on your
location or where you plan on traveling to next. This application expose four integral endpoints for the front end to consume.
1. Forecast for a location
2. Background image at that location
3. User creation
4. Planning a road trip


## Deployment
* http://localhost:3000

## Technologies
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)


## APIs Used
  - [OpenWeather API](https://openweathermap.org/api)
  - [MapQuest](http://www.mapquestapi.com)
  - [Pexels](https://api.pexels.com)
## Endpoints: Requests & Responses

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
6. Create an account with [OpenWeather API](https://home.openweathermap.org/users/sign_up) and request an API key
7. Create an account with [Pexels](https://www.farmsense.net/api/frost-date-api/)
9. Install the Figaro gem: `bundle exec figaro install`
10. Add your API key to the `application.yml` created by Figaro:
  ```yml
  OPENWEATHER_KEY: your_api_key
  PEXELS_KEY: your_api_key
  ```

## Running the tests
Run `bundle exec rspec` to run the test suite

## <ins>Contributors</ins>
<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Darren Kulback](https://www.linkedin.com/in/darren-kulback-9b2394189/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Darren Kulback](https://github.com/dkulback)
