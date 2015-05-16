class Dictionary

  DB = [
    { 
      name: %w{feminism feminist feminists}, 
      definition: %{Ok. Here’s the thing about feminism. Yes, it’s a movement for equal rights. But everyone knows that you could put that energy to better use. Yeah there’s a wage gap and absurdly low numbers of female representatives in politics, but maybe you’re just taking it wrong! And those are hardly important problems in today’s world, if you compare them to poverty in Africa, or pollution, or human trafficking. Anyway, the sexism that we have today is just the leftovers of, like, two thousand years of patriarchy! It can’t just change overnight, you know! And hey, it’s probably going to take another two thousand years before mentalities completely change. So why bother trying?

Everyone’s real problem with modern feminism is that it’s so angry. Maybe if you were nicer, your point would be more widely accepted.} 
    },
    { 
      name: %w{mainsplainer}, 
      definition: %{Onbnoxious bro} 
    },
    { 
      name: %w{computer computers}, 
      definition: %{Oh sorry, this must be way over your head. You see, computers are really hard to understand for a lot of women because it’s a physical object, but also a conceptual framework of technology. So like, yes, it’s a general-purpose device that can be programmed to carry out a set of arithmetic or logical operations automatically. But in our modern times, it’s become a way that we work, and communicate, and live our lives. And even consume entertainment. You probably didn’t think of computers like that, did you?} 
    },
    { 
      name: %w{brainstorming brainstorm}, 
      definition: %{Oh man, wait until you hear the way that I brainstorm. It’s totally off the wall. I’ve talked to a lot of people about brainstorming and this is definitely the best way. First, you take the problem you need to solve. And you start thinking about ideas, by writing them down on paper. When you’re done thinking, then you look at all the ideas that you have. And you pick the best one. BOOM. That’s my version of brainstorming.} 
    },
    { 
      name: ['bechdel test', 'the bechdel test'], 
      definition: "The Bechdel test is a way to find out if a movie or TV show has well-written female characters. Wait you’ve heard of this before? How did you become acquainted with the idea of sexism? I didn’t think you knew about it. "
    },
    { 
      name: ['body image', 'body positive', 'weight loss'], 
      definition: "Not all men are to blame for women's body issues in this country. All those skinny models, that was fashion’s idea! Fashion is run by gay men! That's not even what we like! Straight men don't like that!"
    },
    { 
      name: ['deflategate', 'Tom Brady', 'The Patriots', 'football'], 
      definition: "Oh you want to hear about Deflategate? Yeah that’s a sports things, so I didn’t know if that’s really what you were asking about at first. This might be over your head, but Deflategate is a NFL controversy, stemming from an allegation that the New England Patriots used underinflated footballs in an AFC Championship game. Just so you know, in football the idea is to get the ball to the endzone. That’s how the points happen. "
    },
    { 
      name: ['New York Yankees', 'Yankees lineup','baseball'], 
      definition: "Hey just so you know, in baseball the idea is to get all the way AROUND the bases. That’s how the game works. And the starting lineup for the Yankees is obviously Ellsbury, Gardner, Rodriguez, Teixeira, McCann, Beltran, Headley, Drew. And duh, Gregorius. "
    }

  ]

  def self.lookup(name)
    name = name.downcase.strip

    DB.each do |entry|
      return entry[:definition] if entry[:name].include?(name)
    end
    
    nil
  end

end
