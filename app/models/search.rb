class Search
  require 'wikipedia'

  def query(query)
    results(query)
  end

protected

  def results(query)
    wikipedia_search(query)
    # google_search(query)
  end

  def wikipedia_search(query)
    content = Wikipedia.find(query).content
    puts content
    paragraph = content.match(/('''''#{query}'''''.*)/i)[1]
    wiki = WikiCloth::Parser.new({
      data: paragraph,
      params: {} 
    })
    Sanitize.fragment(wiki.to_html)



    # paragraph = paragraph.gsub(%{'''''}, '')
    # paragraph = paragraph.gsub('[[', '')
    # paragraph = paragraph.gsub("''", '')
    # paragraph = paragraph.gsub(']]', '')
  end
end