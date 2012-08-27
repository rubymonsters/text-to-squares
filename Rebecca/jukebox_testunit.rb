

require "test/unit"



class Jukebox
  def initialize(title, happysong)
    @title = title
    @happysong = happysong
  end

  def title
    @title
    #song title
  end

  def happysong?
    @happysong
    #is this a happy song?
  end

  def happysong
    "Here is a happy song for you to cheer up: #{@title} "
    #a happy song
  end

   def unhappy_song
    "Here is a sad song for you to get sad: #{@title} "
    #an unhappy song
  end
end




class Persons
  def initialize(name, happy)
    @name = name
    @happy = happy
  end

  def name
    @name
    #name of person
  end

  def happy?
    @happy  
    #is person happy?
  end

  def happy
    play2 = Jukebox.new("♫♫...Someone that I used to know...♫♫", false).unhappy_song  
    #pull and play a sad song from the Jukebox class if person is happy
  end

  def unhappy
    play1 = Jukebox.new("♫♫...Girls Just Wanna have Fun...♫♫", true).happysong
    #pull and play a happy song from the Jukebox class if person is sad
  end

  def playing
   happy? ? happy : unhappy  
   #first we ask the if the person is happy. if "yes" it returns the happy method
   #otherwise the unhappy method
  end

  def stillhappy?
   # mood changes to the opposite
  end

  def reaction
    #person stillhappy? reaction: "gets drunk or starts dancing happily"
  end
end

anna = Persons.new("Anna", false)
#new person Anna is not happy at first
gerome = Persons.new("Gerome", true)
#new person Gerome is happy at first






class JukeboxTest < Test::Unit::TestCase
  def test_creating_a_new_song
    song1 = Jukebox.new("title", true)
    assert song1, 'creating a new song with 2 arguments'
  end

  def test_this_is_a_happy_song
    song1 = Jukebox.new("title", true)
    assert song1.happysong?, 'This is a happy song'
  end

  def test_this_is_a_happy_song
    song1 = Jukebox.new("title", false)
    assert !song1.happysong?, 'This is not a happy song'
  end

end



class PersonsTest < Test::Unit::TestCase
  def test_creating_new_person
    anna = Persons.new("Anna", true)
    assert anna, 'creating a new person with 2 arguments'
  end

  def test_if_person_is_happy
    anna = Persons.new("Anna", false)
    assert !anna.happy?, 'No, Anna is not happy'
  end

  def test_play_a_happy_song_for_anna
    anna = Persons.new("Anna", false)
    assert anna.playing, 'Plays a happy Song for Anna'
  end

  def test_play_a_happy_song_for_gerome
    gerome = Persons.new("Gerome", false)
    assert gerome.playing, 'Plays a sad song for Gerome'
  end



end


#class Jukebox creates happy and sad songs for the Persons (depending on their mood)
#class Persons can be happy or unhappy and receive a song to change their mood. 



#what I actually wanted (not archieved yet) is that the jukebox holds a bunch of
#happy/unhappy songs (maybe 10). If person is unhappy the Jukebox will paly a random 
#happy song from a sorted array(hash?)or a random unhappy song if person is happy 
#(to ruin their mood). Afterwards there should be a reaction when their 
# mood changes to the opposite. 

