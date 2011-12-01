# Decorator for OAuth::AccessToken
class Netflixer::Token

  def initialize options
    token = options.delete(:access_token) || raise(ArgumentError, "Missing access_token parameter")
    secret = options.delete(:access_token_secret) || raise(ArgumentError, "Missing access_token_secret parameter")
    @oauth_token = OAuth::AccessToken.new(Netflixer.application, token, secret)
  end

  def get *params
    response = @oauth_token.get *params
    raise NetflixerError, "Netflix API response is: (#{response.code}) #{response.body}" unless response.code == "200"
    Nokogiri::XML(response.body)
  end

end