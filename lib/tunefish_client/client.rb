require 'faraday'
require 'json'
require_relative 'user'
require_relative 'activity'

module TunefishClient
  class Client
    attr_reader :connection

    def initialize(host: "http://tunefi.sh", version: "v1")
      @connection = Faraday.new(url: host)
      @version = version
    end

    def user(id)
      response = connection.get("#{base_url}/users/#{id}")
      data = parse_response_body(response.body)
      User.new(data["user"])
    end

    def users
      response = connection.get("#{base_url}/users")
      data = parse_response_body(response.body)
      data["users"].map { |user_data| User.new(user_data) }
    end

    def user_activities(id)
      response = connection.get("#{base_url}/users/#{id}/activities")
      data = parse_response_body(response.body)
      build_activity_objects(data["activities"])
    end

    def activities
      response = connection.get("#{base_url}/activities")
      data = parse_response_body(response.body)
      build_activity_objects(data["activities"])
    end

    private

      def parse_response_body(body)
        JSON.parse(body)
      end

      def base_url
        "/api/#{@version}"
      end

      def build_activity_objects(activities)
        activities.map { |activity_data| Activity.new(activity_data) }
      end
  end
end
