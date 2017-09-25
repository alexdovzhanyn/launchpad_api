# Launchpad API

This is the APi for the launchpad platform.

## Development

1) Clone this repository
2) Run `bundle install`
3) Run `rake db:setup`
4) Visit localhost:3000

I recommend the Chrome extension JSONView, which formats the Json that's rendered to the webpage in a very readable format.

## API Documentation

### Listings

__Get Listing By ID__
_GET_ `/listings/:id`

SAMPLE RESPONSE:

`
{
  "id": 1,
  "title": "Help me create a partnerships app",
  "description": "This app will let people find partners for projects they want to work on.",
  "user_id": 1,
  "category": "Software",
  "created_at": "2017-09-25T13:48:41.571Z",
  "updated_at": "2017-09-25T13:48:41.571Z"
}
`

__Update a Listing__
_POST_ `/listings/:id`

REQUEST OPTIONS:
..* title (String)
..* description (String)
..* category (String)

SAMPLE RESPONSE:

`
{
  "id": 1,
  "title": "Help me create a partnerships app",
  "description": "This app will let people find partners for projects they want to work on.",
  "user_id": 1,
  "category": "Software",
  "created_at": "2017-09-25T13:48:41.571Z",
  "updated_at": "2017-09-25T13:48:41.571Z"
}
`
