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
    response = wikipedia_search(query) unless response
    # google_search(query)
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
    text
    # mansplain_prefix + text + mansplain_suffix
  end

  def mansplain_prefix(query)

  end
end