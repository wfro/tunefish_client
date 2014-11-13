require './lib/tunefish_client/client'
require_relative 'test_helper'

class TunefishClientTest < Minitest::Test
  def setup
    @client = TunefishClient::Client.new(host: 'http://localhost:3000')
  end

  def test_it_exists
    assert TunefishClient::Client
  end

  def test_it_finds_a_user
    VCR.use_cassette('user') do
      user = @client.user(2)
      assert_equal "John Doe", user.name
    end
  end

  def test_it_finds_all_users
    VCR.use_cassette('users') do
      users = @client.users
      assert_equal "John Doe", users.first.name
    end
  end

  def test_it_finds_activity_for_a_user
    VCR.use_cassette('user_activities') do
      activities = @client.user_activities(2)
      assert_equal "youtube", activities.first.provider
    end
  end

  def test_it_finds_all_activity
    VCR.use_cassette('activities') do
      activities = @client.activities
      assert_equal "youtube", activities.first.provider
    end
  end

  class UserTest < Minitest::Test
    def test_it_exists_and_has_attributes
      user = User.new("name" => "John Doe", "photo" => "example.com/img", "id" => "1", "activity_ids" => ["1", "2"])
      assert_equal "John Doe", user.name
    end
  end

  class ActivityTest < Minitest::Test
    def test_it_exists_and_has_attributes
      activity = Activity.new("id" => "1", "url" => "http://aurl.com", "provider" => "youtube")
      assert_equal "youtube", activity.provider
    end
  end
end
