# Encapsulate Title information
class Netflixer::Title

  def initialize uri
    @uri = uri
    @title_doc = Netflixer.get(slug).css("catalog_title")
  end

  def mpaa
    #TODO, replace with xpath('//category[@scheme="http://api.netflix.com/categories/mpaa_ratings"]')
    #      and generalize with user title_states
    (css("category").select {|cat| cat.attr("scheme") == "http://api.netflix.com/categories/mpaa_ratings" }.first.attr("term") rescue "NR")
  end

  def title
    doc_title "regular"
  end

  def short_title
    doc_title "short"
  end

  def release_year
    text "release_year"
  end

  def average_rating
    text "average_rating"
  end

  private

  def slug
    @uri.sub %r{^http://api\.netflix\.com}, ""
  end

  def text tag
    css(tag).text
  end

  def doc_title title_type
    css("title").attr( title_type ).value
  end

  def css tag
    @title_doc.css tag
  end

end