class SplainrTranslator
  
  def self.execute(query)
    search = Search.new
    results = search.define(query)

    if results.present?
      return results.map{ |text|
        self.shorten(text, 400)
      }.flatten
    end 
    return nil
  end

  def self.shorten(text, length, divisor = 2)
    if text.split(' ').count > length
      explosion = text.split(' ')
      arr1 = explosion[0, length].join(' ') + '...'
      arr2 = self.shorten(explosion[length, explosion.size].join(' '), length)
      return [arr1, arr2]
    else
      text
    end
  end
end