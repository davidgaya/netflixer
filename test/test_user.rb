require 'helper'

class TestUser < Test::Unit::TestCase

  context "User" do
    setup do
      setup_application
    end

    # Describe User
    should "accept options on creation" do
      assert Netflixer::User.new :uid => 'a', :access_token => 'adf', :access_token_secret => 'adfasd'
    end

    should "fail on creation if options do not contain authentication" do
      assert_raises(ArgumentError) { Netflixer::User.new :uid => 'a' }
      assert_raises(ArgumentError) { Netflixer::User.new :uid => 'a', :access_token => 'adf' }
    end

    should "fail on creation if Netflixer application is not setup" do
      Netflixer.application = {}
      assert_raises(Netflixer::AuthenticationError) { Netflixer::User.new :uid => 'a', :access_token => 'adf', :access_token_secret => 'adfasd' }
    end

    # Describe a user
    should "return a list of states for a given movie" do
      # Given a netflixer user
      assert a_user = Netflixer::User.new(:uid => 'a', :access_token => 'adf', :access_token_secret => 'adfasd')
      # And a given Netflix Title
      title_id = "http://api.netflix.com/catalog/titles/movies/512381"
      # When I ask for state of the title id
      assert responded_states = a_user.title_states( title_id )
      # Then responded states should include Instant Watch
      assert responded_states.include?("Instant"), "Response doesn't include Instant"
      assert responded_states.include?("DVD"), "Response doesn't include DVD"
    end

  end

end
