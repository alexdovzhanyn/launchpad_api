# Launchpad API

This is the APi for the launchpad platform.

> __NOTE:__ All requests must have the `access_token`, `client`, and `uid` attached in the request headers. The `access_token` is consumed
> upon each request and a new one is returned in the header of the response each time.

## Listings

| Path          | Method        | Parameters                                                   | Purpose               |
|:------------- |:--------------| ------------------------------------------------------------:|:----------------------|
| /listings/:id | GET           | N/A                                                          | Fetch listing by ID   |
| /listings/new | POST          | `title`, `description`, `category`                           | Create a listing      |
| /listings/:id | PUT           | `title`, `description`, `category`                           | Update a listing      |
| /listings/:id | DELETE        | N/A                                                          | Delete a listing      |

## Users

We use the `devise_token_auth` gem to manage our user authentication. These are a few routes that they provide for us, but a more
comprehensive list can be found [here](https://github.com/lynndylanhurley/devise_token_auth#usage-tldr)


| Path           | Method        | Parameters                                    | Purpose                                       |
|:---------------|:--------------| ---------------------------------------------:|:----------------------------------------------|
| /users         | POST          | `email`, `password`, `password_confirmation`  | Register a new user                           |
| /users         | DELETE        | _optional:_ `id`                              | Delete an existing user or the currently logged in user if no ID is given |
| /users/sign_in | POST          | `email`, `password`                           | Authenticate a user and get their token       |
| /users/sign_out| DELETE        | `uid`, `access_token`, `client`               | Inauthenticate a user and destroy their token |
| /users/:id     | GET           | N/A                                           | Fetch information about a user                |

## Development

1) Clone this repository
2) Download and install Postgres
3) Run `bundle install`
4) Add necessary values to the .env.sample file
5) Rename .env.sample to .env
6) Run `rake db:setup`
7) Run `rails s`
8) Visit localhost:3000

I recommend the Chrome extension JSONView, which formats the Json that's rendered to the webpage in a very readable format.
