class Search
  require 'wikipedia'

  def self.query(query)
    search = Search.new
    search.results(query)
  end

  def results(query)
    wikipedia_search(query)
    # google_search(query)
  end

protected

  def wikipedia_search(query)
    content = Wikipedia.find(query).content
    puts content
    paragraph = content.match(/\{\{Infobox.+?\n\}\}\n(.+?)\n/im)[1]
    wiki = WikiCloth::Parser.new({
      data: paragraph,
      params: {} 
    })
    text = Sanitize.fragment(wiki.to_html).strip.gsub(/\[\d+\]/,'')
  end
end