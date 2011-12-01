require 'helper'

class TestTitle < Test::Unit::TestCase

  def setup
    setup_application
  end

  context "Title" do
    should "exist" do
      assert Netflixer::Title
    end
    should "be created with a valid netflix ID" do
      assert_nothing_raised do
        Netflixer::Title.new "http://api.netflix.com/catalog/titles/movies/512381"
      end
    end
  end

  context "a valid Netflix title" do
    setup { @title = Netflixer::Title.new "http://api.netflix.com/catalog/titles/movies/512381" }
    should "have a title" do
      assert_equal "Fly Away Home", @title.title
    end
    should "have a short_title" do
      assert_equal "Fly Away Home", @title.short_title
    end
    should "have a release_year" do
      assert_equal "1996", @title.release_year
    end
    should "have an average_rating" do
      assert_equal "3.7", @title.average_rating
    end
    should "have a mpaa" do
      assert_equal "PG", @title.mpaa
    end
  end
end