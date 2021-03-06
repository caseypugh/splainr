class Search
  require 'wikipedia'

  def initialize
  end

  def define(query)
    find(query)
  end

protected

  def find(query)
    query = query.strip
    response = dictionary_search(query)
    response = wikipedia_search(query) if !response || response.first.blank?
    response
  end

  def dictionary_search(query)
    Dictionary::lookup(query)
  end

  def wikipedia_search(query)
    content = Rails.cache.fetch("/wikipedia/#{query}", expires_in: 1.day, race_condition_ttl: 1.minute) do
      Wikipedia.find(query.downcase.titlecase).content
    end

    if content
      paragraph = content.gsub(/\{\{([^\{\{]*?)\}\}/m, '')
      paragraph = paragraph.gsub(/\{\{([^\{\{]*?)\}\}/m, '')
      paragraph = paragraph.gsub(/\{\{([^\{\{]*?)\}\}/m, '')
      paragraph = paragraph.match(/('{2,5}.+?'{2,5}.+?)\n/im)
      if paragraph
        wiki = WikiCloth::Parser.new({
          data: paragraph[1],
          params: {} 
        })
        return mansplain(query, Sanitize.fragment(wiki.to_html).strip.gsub(/\[\d+\]/,''))
      end
    end
  end

  def mansplain(query, text)
    [Dictionary::prefix_lookup(query), text + ' ' + Dictionary::suffix_lookup(query)]
  end
end