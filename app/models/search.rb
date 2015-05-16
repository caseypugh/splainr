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
    if content
      puts content
      # paragraph = content.match(/\{\{Infobox.+?\n\}\}\n(.+?)\n/im)
      paragraph = content.gsub(/\{\{.+?\}\}/, '')
      paragraph = paragraph.gsub(/\{\{.+?\}\}/m, '')
      paragraph = paragraph.match(/.+?('{2,5}.+?'{2,5}.+?)\n/im)

      if paragraph
        wiki = WikiCloth::Parser.new({
          data: paragraph[1],
          params: {} 
        })
        text = Sanitize.fragment(wiki.to_html).strip.gsub(/\[\d+\]/,'')
      end
    end
  end
end