require 'rubygems'
require 'oauth'
require 'nokogiri'

class Netflixer
  class << self
    def application= options
      @app_key = options[:key]
      @app_secret = options[:secret]
      @app_name = options[:name]
    end

    def application
      raise AuthenticationError, "Netflixer application must be set up with key, secret and name before any use." unless @app_key and @app_secret and @app_name
      @netflix ||= ::OAuth::Consumer.new(@app_key,@app_secret, {
          :site => "http://api.netflix.com",
          :request_token_path => "/oauth/request_token",
          :access_token_path => "/oauth/access_token",
          :authorize_url => "https://api-user.netflix.com/oauth/login",
          :application_name => @app_name})
    end

    def get *params
      response = application.request(:get, *params)
      raise NetflixerError, "Netflix API response is: (#{response.code}) #{response.body}" unless response.code == "200"
      Nokogiri::XML(response.body)
    end
  end

  class AuthenticationError < RuntimeError; end
  class NetflixerError < RuntimeError; end

end

require 'netflixer/token'
require 'netflixer/title'
require 'netflixer/user'
