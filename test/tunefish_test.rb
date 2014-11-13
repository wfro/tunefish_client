require './lib/tunefish/client'
require_relative 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @client = Tunefish::Client.new('http://localhost:3000')
  end

  def test_it_exists
    assert Tunefish::Client
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
      assert_instance_of Array, activities
      assert_equal "youtube", activities.first.provider
    end
  end
end
