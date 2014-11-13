# Tunefish

A client for the [Tunefish](https://github.com/tyrbo/tunefish) RESTful API.  Tunefish is a music aggregation service that lets users link accounts from services like Soundcloud and Youtube, and populates an activity feed with relevant new music.  "Activities" are either youtube videos, soundcloud tracks, or tweets with the hashtag "#tf".  The Tunefish API currently supports users and activities.  You can find:

* All activities
* Activities for a given user
* All users
* Information for a specific user

## Installation

Add it to your Gemfile:

`gem 'tunefish'`

Bundle:

`$ bundle`

Or install it yourself as:

`$ gem install tunefish`

## Usage

Instantiate a new client specifying the API version like so:

```ruby
require 'tunefish_client'

client = TunefishClient::Client.new(version: "v1")

# retrieve a list of user objects
client.users

# retrieve a single user's information
user_id = 1
client.user(user_id)

# retrieve a list of activities
client.activities

# retrieve a list of activities for a given user
user_id = 1
client.user_activitites(user_id)
```

