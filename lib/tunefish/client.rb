require 'faraday'
require 'json'
require_relative 'user'

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
  end
end
