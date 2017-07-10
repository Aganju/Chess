# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  return nil
end

# PHASE 3
class CoffeeError < StandardError
end

class NotFruitError < StandardError
end

class LessThanFiveError < StandardError
  def initialize(msg = "Years known is less than 5")
    super
  end
end

class StringLengthError < StandardError
  def initialize(msg = "String length is too short")
    super
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    puts "Not a fruit but you gave a coffee you get to try again"
    retry
  rescue NotFruitError
    puts "Not a fruit"
  end

end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise LessThanFiveError if yrs_known < 5
    raise StringLengthError if name.length == 0 || fav_pastime.length == 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
