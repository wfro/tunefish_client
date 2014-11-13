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
      assert_instance_of Array, users
      assert_instance_of User, users.first
    end
  end
end
