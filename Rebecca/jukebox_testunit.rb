# Prepare
# Come up with an idea for a program that contains at least two classes (a role playing game character)
# Create an empty file, require "test/unit" and add empty class definitions for your new classes.
# Write down your expectations about what the classes do in plain text/comments at the end of the file:
# - How will the classes behave towards their outer world/each other?
# - What will they expose, what behaviour will they offer?
# Write down the method names as empty method definitions (including the arguments list) and add a comment to their body about what the method should do.
# Create an empty test case class for each of your classes.
# Run the file, it should print out the test output.
# Commit and push this.

require "test/unit"


class Person
  attr_reader :name

  def initialize(name)
    @name = name
    @state = :sitting
  end

  def dancing
    @state = :dancing
  end

  def dancing?
    @state == :dancing
  end
end


class Song
  attr_reader :titles
  
  def initialize(titles)
    @titles = titles
    @state = :unplayed
  end

  def play
    @state = :playing
  end
  
  def play?
    @state == :playing
  end
end


class Jukebox

   def initialize
    @state = :off
  end

  def on
    @state = :on
  end

  def ready?
    @state == :on
  end

  def receive(titles)
    if ready?
      @song = Song.new(titles)
    else
      puts "Can´t access playlist if jukebox is off "
    end
  end

  def play
    if ready?
      @song.play
      @song
    else
      puts "Nothing to play"
    end
  end

  def nice(name)
    if play
      @person = Person.new(name).dancing
    else
      puts "Jukebox is not ready yet"
    end
  end

  def mean(name)
    if @person
      @state = :off
      "Your dancing bores me. No more songs for you. [jukebox goes offline]"
    else
      "Jukebox can only be mean if the person is dancing"
    end
  end
end


titles = ["...Girls Just Wanna Have Fun...", "...Someone That I Used To Know...", "...Hyper, Hyper...", "...Sweet Home Alabama..."].shuffle.pop
song = Song.new(titles)


# jukebox = Jukebox.new
# jukebox.on
# p jukebox.ready?

# jukebox.receive(titles)
# song = jukebox.play
# song.titles

# anna = Person.new("Anna")
# p jukebox.nice(anna)
# p jukebox.mean(anna)
# p song.play?


class PersonTest < Test::Unit::TestCase
  def test_create_new_person
    anna = Person.new("Anna")
    assert anna, "new person with a name"
  end

  def test_person_sitting?
    anna = Person.new("Anna")
    assert !anna.dancing?, "Anna is still sitting"
  end

  def test_person_dancing
    anna = Person.new("Anna")
    anna.dancing
    assert anna.dancing?, "Anna is dancing now"
  end
end


class SongTest < Test::Unit::TestCase
  def test_create_new_song
    song = Song.new("...Hyper, Hyper...")
    assert song, 'New song'
  end

  def test_song_playing?
    song = Song.new("Song Title")
    assert !song.play?, 'song is not playing yet'
  end

  def test_song_playing
    song = Song.new("Song Title")
    song.play
    assert song.play?, 'song is playing now'
  end

  def test_song_still_playing_after_jukebox_offline?
  #song cannot play if jukebox is offline/not ready
  end
end


class JukeboxTest < Test::Unit::TestCase
  def test_create_jukebox
    jukebox = Jukebox.new
    assert jukebox, 'new Jukebox'
  end

  def test_jukebox_off?
    jukebox = Jukebox.new
    assert !jukebox.ready?, "jukebox is off"
  end

   def test_jukebox_on
    jukebox = Jukebox.new
    assert jukebox.on, "jukebox is on"
  end

    def test_jukebox_still_off?
    jukebox = Jukebox.new
    jukebox.on
    assert jukebox.ready?, "jukebox is on and ready"
  end


  def test_jukebox_receives_titles
    jukebox = Jukebox.new
    jukebox.on
    titles = ["title1", "title2", "title3", "title4"].shuffle.pop
    assert jukebox.receive(titles), "jukebox receives titles"
  end

  def test_jukebox_ready?
    jukebox = Jukebox.new
    jukebox.on
    assert jukebox.ready?, "jukebox is ready to play"
  end

  def test_jukebox_playing_song
    jukebox = Jukebox.new
    jukebox.on
    titles = ["title1", "title2", "title3", "title4"].shuffle.pop
    jukebox.receive(titles)
    song = jukebox.play
    song.titles
    assert song.play, "plays a song"
  end

  def test_jukebox_nice
    jukebox = Jukebox.new
    jukebox.on
    titles = ["title1", "title2", "title3", "title4"].shuffle.pop
    jukebox.receive(titles)
    song = jukebox.play
    song.titles
    assert jukebox.nice(name), "makes the person dance by playing a song"
  end

  def test_jukebox_mean
    jukebox = Jukebox.new
    jukebox.on
    titles = ["title1", "title2", "title3", "title4"].shuffle.pop
    jukebox.receive(titles)
    song = jukebox.play
    song.titles
    jukebox.nice(name)
    jukebox.mean(name)
    assert jukebox.mean(name), "stops the music and shuts down"
 end
end





#create songs for the jukebox and have the jukebox play one song so that
#a sitting person will start to dance. If the person starts to dance the jukebox
#will shut down because it´s mean. 

