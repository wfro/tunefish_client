# Tunefish

A client for the [Tunefish](https://github.com/tyrbo/tunefish) RESTful API.

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
```

