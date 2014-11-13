require 'faraday'
require 'json'
require_relative 'user'
require_relative 'activity'

module Tunefish
  class Client
    attr_reader :connection

    def initialize(host)
      @connection = Faraday.new(url: host)
    end

    def user(id)
      response = connection.get("/api/v1/users/#{id}")
      data = JSON.parse(response.body)
      User.new(data["user"])
    end

    def users
      response = connection.get("/api/v1/users")
      data = JSON.parse(response.body)
      data["users"].map { |user_data| User.new(user_data) }
    end

    def user_activities(id)
      response = connection.get("/api/v1/users/#{id}/activities")
      data = JSON.parse(response.body)
      data["activities"].map { |activity_data| Activity.new(activity_data) }
    end

    def activities
      response = connection.get("/api/v1/activities")
      data = JSON.parse(response.body)
      data["activities"].map { |activity_data| Activity.new(activity_data) }
    end
  end
end
