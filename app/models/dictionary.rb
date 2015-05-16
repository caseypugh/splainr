class Dictionary

  DB = [
    { name: %w{feminism feminist}, definition: "It's for hardcore females." },
    { name: %w{mainsplainer}, definition: "Onbnoxious bro" }
  ]

  def self.lookup(name)
    name = name.downcase.strip

    DB.each do |entry|
      return entry[:definition] if entry[:name].include?(name)
    end
    
    nil
  end

end