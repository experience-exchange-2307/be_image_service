# Experience Exchange (Back-End / Microservice)
## About
Experience Exchange was built with a core focus in mind - that of the ability to share experiences and knowledge with others. Want to learn to knit? Find a nearby knitting buddy who can pass on their years of knowledge! What about musical interest, piano perhaps? Search for your interests, and whether you'd like an in-person or remote buddy, and you're off to the races!

Experience Exchange is built on a Rails backend leveraging microservices, with a React/TypeScript frontend. The app is deployed via [Heroku](https://dashboard.heroku.com/login) for backend, and [Vercel](https://vercel.com/) for frontend.

This specific repo is a microservice for the retrieval of images for user profiles. The microservice was built with the intent to dockerize/containerize for deployment.

<br>Link to [Frontend Repo](https://github.com/experience-exchange-2307/fe_experience_exchange)
<br>Link to [Backend Repo](https://github.com/experience-exchange-2307/be_experience_exchange)

## Contributors
**Backend**

- Antoine Aube - [GitHub](https://github.com/Antoine-Aube) || [LinkedIn](https://www.linkedin.com/in/antoineaube/)
- Ethan Bustamante - [GitHub](https://github.com/ethanb1145) || [LinkedIn](https://www.linkedin.com/in/ethan-bustamante/)
- Tyler Blackmon - [GitHub](https://github.com/tblackmon-tiel) || [LinkedIn](www.linkedin.com/in/tyler-blackmon/)

**Frontend**

* Database creation
- Devin Altobello - [GitHub](https://github.com/daltobello) || [LinkedIn](https://www.linkedin.com/in/devin-altobello-2100036b/)
- Jen Ziel - [GitHub](https://github.com/jenziel) || [LinkedIn](https://www.linkedin.com/in/jen-ziel400/)
- Marisa Wyatt - [GitHub](https://github.com/Marisa5280) || [LinkedIn](https://www.linkedin.com/in/marisarwyatt/)

## Technologies
Primary:
- Ruby 3.2.2
- Rails 7.0.8
- Docker

Production Gems:
- [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [Faraday](https://lostisland.github.io/faraday/#/)

Testing Gems:
- [rspec-rails](https://github.com/rspec/rspec-rails)

## Installation/Setup
### Cloning and installing dependencies
- `git clone <repo_name>`
- `cd <repo_name>`
- `bundle install`

### Build with Docker
- Ensure [Docker](https://www.docker.com/) is installed locally
- Create a docker image: `docker build -t . experience_exchange_images`
- Run the app via the docker image: `docker run -p 5000:5000 experience_exchange_images` (note your 5000 port will need to be unbound, otherwise specify a separate port)

### Third Party APIs
Experience Exchange uses two third party APIs - [Geoapify](https://apidocs.geoapify.com/docs/geocoding/forward-geocoding/#about) for geocoding, and [Unsplash](https://unsplash.com/documentation) for randomized user images. Only Unsplash needs to be setup in this microservice repo for retrieval of an image for a user's profile.

Follow the Unsplash documentation to get an API key, and place it in the rails credentials file as follows:
- `EDITOR="code --wait" rails credentials:edit`
```
unsplash:
  client_id: <YOUR_CLIENT_ID>
```

### Setting up data
It's worth noting this repo is not intended to stand alone, having no database or way to hold its own data. Instead, it should only return data when its primary endpoint is hit (see below).

## Testing
There are two options for testing, either the existing test suite, or manual testing with Postman.
- Test suite: `bundle exec rspec`
- Postman: `rails s` (or build via Docker as seen above), then test on http://localhost:5000

## Endpoints
**Fetch an image - GET /api/v1/images**
<details>
  <summary>Example Response</summary>

  ```json
  {
      "data": {
          "id": "null",
          "type": "image",
          "attributes": {
              "raw_image": "some_url.com"
          }
      }
  }
  ```
</details>
