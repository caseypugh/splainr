class Dictionary

  DB = [
    { 
      name: %w{feminism feminist feminists}, 
      definition: [
        'Ok. Here’s the thing about feminism. Yes, it’s a movement for equal rights. But everyone knows that you could put that energy to better use. Yeah there’s a wage gap and absurdly low numbers of female representatives in politics, but maybe you’re just taking it wrong! And those are hardly important problems in today’s world, if you compare them to poverty in Africa, or pollution, or human trafficking. Anyway, the sexism that we have today is just the leftovers of, like, two thousand years of patriarchy! It can’t just change overnight, you know! And hey, it’s probably going to take another two thousand years before mentalities completely change. So why bother trying?', 
        'Everyone’s real problem with modern feminism is that it’s so angry. Maybe if you were nicer, your point would be more widely accepted.'
      ]
    },
    { 
      name: %w{mansplainer, mansplaining}, 
      definition: %{nah bro, too heavy} 
    },
    { 
      name: %w{computer computers}, 
      definition: %{Oh sorry, this must be way over your head. You see, computers are really hard to understand for a lot of women because it’s a physical object, but also a conceptual framework of technology. So like, yes, it’s a general-purpose device that can be programmed to carry out a set of arithmetic or logical operations automatically. But in our modern times, it’s become a way that we work, and communicate, and live our lives. And even consume entertainment. You probably didn’t think of computers like that, did you?} 
    },
    { 
      name: %w{brainstorming brainstorm}, 
      definition: [
        'Oh man, wait until you hear the way that I brainstorm. It’s totally off the wall. I’ve talked to a lot of people about brainstorming and this is definitely the best way.',
        'First, you take the problem you need to solve. And you start thinking about ideas, by writing them down on paper. When you’re done thinking, then you look at all the ideas that you have. And you pick the best one. BOOM. That’s my version of brainstorming.',
        ]
    },
    { 
      name: ['bechdel test', 'the bechdel test'], 
      definition: "The Bechdel test is a way to find out if a movie or TV show has well-written female characters. Wait you’ve heard of this before? How did you become acquainted with the idea of sexism? I didn’t think you knew about it."
    },
    { 
      name: ['body image', 'body positive', 'weight loss'], 
      definition: "Not all men are to blame for women's body issues in this country. All those skinny models, that was fashion’s idea! Fashion is run by gay men! That's not even what we like! Straight men don't like that!"
    },
    { 
      name: ['deflategate', 'Tom Brady', 'The Patriots', 'football'], 
      definition: [
        'Oh you want to hear about Deflategate? Yeah that’s a sports things, so I didn’t know if that’s really what you were asking about at first.', 
        'This might be over your head, but Deflategate is a NFL controversy, stemming from an allegation that the New England Patriots used underinflated footballs in an AFC Championship game. Just so you know, in football the idea is to get the ball to the endzone. That’s how the points happen.'
      ]
    },
    { 
      name: ['New York Yankees', 'Yankees lineup','baseball'], 
      definition: "Hey just so you know, in baseball the idea is to get all the way AROUND the bases. That’s how the game works. And the starting lineup for the Yankees is obviously Ellsbury, Gardner, Rodriguez, Teixeira, McCann, Beltran, Headley, Drew. And duh, Gregorius. "
    },
    {
      name: ['comedy', 'jokes', 'real comedy'],
      definition: [
        'I didn’t really hear that last thing you said because I was thinking about all the the stuff I want to say about comedy.', 
        'So as you probably don’t know, comedy is any discourse generally intended to be humorous or to amuse by inducing laughter. Let me paint you a picture: Satire and political satire use comedy to portray persons or social institutions as ridiculous or corrupt.', 
        'That’s why, like, if you think a joke is offensive, you’re probably just not listening to it for its subversive message, you know? And you have to just accept that everything that a stand-up comic writes is coming from a good intentions, and is probably a great joke.'
      ]
    },
    {
      name: 'are women funny',
      definition: ['hahahahha', 'Ask me about real comedy some time.']
    },
    { 
      phone: true,
      name: %{gender}, 
      definition: %{This is pretty complex, so I thought I’d call. You know what sucks about being a woman? The pay gap. The cool thing? Having boobs and being able to have sex whenever you want. Everyone knows that.}
    }
  ]

  PREFIXES = [
    "Oh no no no. You are totally wrong about @query@.",
    "Oh you want to know about @query@? Of course you do.",
    "Well the thing about @query@ is...Hey hold on. It didn’t really seem like you were listening. Yeah if you could just listen up while I tell you about @query@? Shhhh. It’s going to take your whole focus to understand what I’m saying here. ",
    "I didn't really hear that last thing you said because I was thinking about all the the stuff I want to say about @query@.",
    "I just heard about @query@ five minutes ago, but I am very knowledgeable about it. ",
    "This may really bore you..."
  ]
  
  MODIFIERS = [
    "You probably don't even know that @query@ is",
    "So as you may or may not be able to tell, @query@ is",
    "It might help if you think about it like a shoe store, since that’s something you know. If @query@ were a shoe store, it would be a shoe store that is",
    "Basically anyone who knows anything about @query@ knows that it is"
    ]

  SUFFIXES = [
    "Basically @query@ is the answer.",
    "Pretty simple, really.",
    "And that's not all I could say.",
    "Oh that's what you just said? Your idea sounds so much better when I rephrase it.",
    "If you didn’t get all that, just ask your dad about it. "
  ]

  IS_PHONE = 'phonezone!!!!!'

  def self.lookup(name)
    name = name.downcase.strip

    DB.each do |entry|
      entry[:name] = entry[:name].class == String ? [entry[:name]] : entry[:name]
      if entry[:name].map{ |name| name.downcase }.include?(name)
        rsp = entry[:definition].class == String ? [entry[:definition]] : entry[:definition]
        if entry[:phone] == true
          return [IS_PHONE] + rsp
        else
          return rsp
        end
      end
    end
    
    nil
  end

  def self.prefix_lookup(query)
    PREFIXES.shuffle.first.gsub('@query@', query)
  end

  def self.suffix_lookup(query)
    SUFFIXES.shuffle.first.gsub('@query@', query)
  end

end
