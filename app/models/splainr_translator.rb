class SplainrTranslator
  
  def self.execute(query)
    search = Search.new
    search.define(query)
  end
end