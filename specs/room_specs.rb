require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( "../room.rb" )
require_relative( "../song.rb" )
require_relative( "../guest.rb" )

class RoomTest < Minitest::Test

  def setup

    @song1 = Song.new( "Row Row Row your boat" )
    @song2 = Song.new( "Ba Ba black sheep" )
    @songs1 = [ @song1, @song2 ]

    @song3 = Song.new( "Mary had a litte lamb" )

    @songs2 = [ @song3 ]

    @guest1 = Guest.new( "Bob McJoe", 10000, "Row Row Row your boat" )
    @guest2 = Guest.new( "Joe McBob", 20000, "Humpty dumpty" )
    @guests1 = [ @guest1, @guest2 ]

    @guest3 = Guest.new( "Tim McTam", 30000 )
    @guests2 = [ @guest3 ]

    @room1 = Room.new( @guests1, @songs1 )
    @room2 = Room.new( )

  end

  def test_has_guests_songs_capacity_cost()

    assert_equal( 2, @songs1.size())
    assert_equal( 2, @guests1.size())
    assert_equal( 6, @room1.capacity())
    assert_equal( 1000, @room1.cost())

  end

  def test_add_guest()

    @room1.add_guest( @guest3 )
    assert_equal( 3, @room1.guests().size())

  end

  def test_remove_guest()

    @room1.remove_guest( @guest2 )
    assert_equal( 1, @room1.guests().size())

  end

  def test_add_song()

    @room1.add_song( @song3 )
    @room2.add_song( @song3 )
    assert_equal( 3, @room1.songs().size())
    assert_equal( 1, @room2.songs().size())

  end

  def test_capacity()

    @room1.add_guest( @guest3 )
    @room1.add_guest( @guest3 )
    @room1.add_guest( @guest3 )
    @room1.capacity_check( @guests1 )
    assert_equal( true, @room1.capacity_check( @guests1 ))
    @room1.add_guest( @guest1 )
    assert_equal( "Room is full", @room1.add_guest( @guests1 ))
    assert_equal( false, @room1.capacity_check( @guests1 ))

  end

  def test_charge()

    @room1.charge( @guest1 )
    @room1.charge( @guest2 )
    @room1.add_guest( @guest3 )
    assert_equal( 3000, @room1.till())
    assert_equal( 9000, @guest1.money())
    assert_equal( 19000, @guest2.money())
    assert_equal( 29000, @guest3.money())

  end

  def test_fave_song_in_room()

    @room1.fave_song_in_room( @guest1 )
    assert_equal( "WHOO this is my jam", @room1.fave_song_in_room( @guest1 ) )
    @room1.fave_song_in_room( @guest2 )
    assert_equal( "Aww they don't have my song", @room1.fave_song_in_room( @guest2 ))

  end

end
