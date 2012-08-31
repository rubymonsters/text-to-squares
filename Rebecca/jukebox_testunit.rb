# # # Prepare
# # # Come up with an idea for a program that contains at least two classes (a role playing game character)
# # # Create an empty file, require "test/unit" and add empty class definitions for your new classes.
# # # Write down your expectations about what the classes do in plain text/comments at the end of the file:
# # # - How will the classes behave towards their outer world/each other?
# # # - What will they expose, what behaviour will they offer?
# # # Write down the method names as empty method definitions (including the arguments list) and add a comment to their body about what the method should do.
# # # Create an empty test case class for each of your classes.
# # # Run the file, it should print out the test output.
# # # Commit and push this.

require "test/unit"


class Person
  attr_accessor :name, :state


  def initialize(name)
    @name = name
    @state = :sitting
  end

  def to_s
  "#{@name}"
  end

  def dancing
    @state = :dancing
  end

  def dancing?
    @state == :dancing
  end
end


class Song
   attr_reader :name, :artist, :plays
   @@plays = 0

  def initialize(artist,name)
    @artist = artist
    @name = name
    @plays = 0
  end

  def to_s
    "#{@artist} by #{@name}"
  end

  def play
    @plays += 1
    @@plays += 1 
  end
end


class Jukebox
  attr_reader :songs, :persons
  
  def initialize(songs)
    @songs = songs
    @state = :off
    @persons = []
  end

  def on?
    @state == :on
  end

  def get_person(person)
    @persons << person
  end

  def time_to_play?
    @persons.any? { |person| person.state == :sitting} 
  end

  def time_to_play
    if time_to_play?
      play
      @persons.each do |person|
        person.state = :dancing
      end
    else 
      puts "Everyone is already dancing!"
    end
  end

  def time_to_stop
    if !time_to_play?
      stop 
      @persons.each do |person|
        person.state = :sitting
      end
    else 
      puts "Everyone is already sitting!"
    end
  end

  def play   
    @state = :on
    puts "#{@persons}, here a song for you: #{@songs.shuffle.pop}"
  end

  def stop
    @state = :off
    puts "#{@persons}, no more songs for you. I do not like the way you move."
  end
end


# song1 = Song.new("♪♫...Girls Just Wanna Have Fun...♪♫", "Weird Al")
# song2 = Song.new("♪♫...Hyper Hyper..♪♫", "Scooter")
# song3 = Song.new("♪♫..Someone That I Used To Know...♪♫", "Gotye")
# song4 = Song.new("♪♫...Blubb...♪♫", "Unkown Artist")

# songs = [song1,song2,song3,song4]

# jukebox = Jukebox.new(songs)
# anna = Person.new("Anna")

# jukebox.get_person(anna)
# p anna.dancing?
# p jukebox.time_to_play?
# jukebox.time_to_play
# p jukebox.on?
# p anna.dancing?
# jukebox.time_to_stop
# p anna.dancing?
# p jukebox.on?



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
    song = Song.new("...Hyper, Hyper...", "Artist")
    assert song, 'Create new song'
  end

  def test_song_count
    song = Song.new("Song Title", "Artist")
    11.times do song.play
    end
    assert_equal song.play, 12
  end
end


class JukeboxTest < Test::Unit::TestCase
  def test_create_jukebox
    song1 = Song.new("name", "artist")
    jukebox = Jukebox.new(song1)
    assert jukebox, 'new jukebox'
  end

  def test_create_on?
    song1 = Song.new("name", "artist")
    jukebox = Jukebox.new(song1)
    assert jukebox.on? == false, 'jukebox is off'
  end


  def test_jukebox_person_dancing_to_song?
    song1 = Song.new("name", "artist")
    song2 = Song.new("name", "artist")
    songs = [song1, song2]
    jukebox = Jukebox.new(songs)
    anna = Person.new("Anna")
    jukebox.get_person(anna)
    jukebox.time_to_play
    assert anna.dancing? == true, 'jukebox plays a random song and anna is dancing'
  end

  def test_jukebox_stop
    song1 = Song.new("name", "artist")
    song2 = Song.new("name", "artist")
    songs = [song1, song2]
    jukebox = Jukebox.new(songs)
    anna = Person.new("Anna")
    jukebox.get_person(anna)
    jukebox.time_to_play
    jukebox.time_to_stop
    assert jukebox.on? == false, 'jukebox is off and plays no more songs for anna'
  end

  def test_jukebox_stop
    song1 = Song.new("name", "artist")
    song2 = Song.new("name", "artist")
    songs = [song1, song2]
    jukebox = Jukebox.new(songs)
    anna = Person.new("Anna")
    jukebox.get_person(anna)
    jukebox.time_to_play
    jukebox.time_to_stop
    assert anna.dancing? == false, 'after jukebox is off, anna is sitting again'
  end
end


#jukebox takes a song array and plays a random song from that list if a person is sitting. 
#if a song is played person is dancing.
#if person is dancing jukebox goes off and plays no more songs. person is sitting again. 