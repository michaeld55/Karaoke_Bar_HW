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

    @guest1 = Guest.new( "Bob McJoe" )
    @guest2 = Guest.new( "Joe McBob" )
    @guests1 = [ @guest1, @guest2 ]

    @room1 = Room.new( @guests1, @songs1 )

  end

  def test_has_guests_songs()

    assert_equal( 2, @songs1.size())
    assert_equal( 2, @guests1.size())

  end

  def test_add_guest()

    @guest3 = Guest.new( "Tim McTam" )
    @room1.add_guest( @guest3 )
    assert_equal( 3, @room1.guests().size())

  end

  def test_remove_guest()

    @room1.remove_guest( @guest2 )
    assert_equal( 1, @room1.guests().size())

  end

end
