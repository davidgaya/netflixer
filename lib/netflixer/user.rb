# Fetch user signed information
class Netflixer::User

  def initialize options
    @uid = options.delete(:uid) || raise(ArgumentError, "Missing uid parameter")
    @token = Netflixer::Token.new options
  end

  def title_states title
    doc = @token.get("/users/#{@uid}/title_states?title_refs=#{title}")
    doc.xpath('//category[@scheme="http://api.netflix.com/categories/title_formats"]').map{|n| n.attr('label')}
  end

end