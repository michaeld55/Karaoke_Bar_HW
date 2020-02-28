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

    @room1 = Room.new( @songs1, @guests1)

  end

  def test_has_guests_songs()

    assert_equal( 2, @songs1.size())
    assert_equal( 2, @guests1.size())

  end

  def test_add_guest()

    @guest3 = Guest.new( "Tim McTam" )
    result = @room1.add_guest( @guest3 )
    assert_equal( result, @room1.guests)

  end

  def test_remove_guest()

    result = @room1.remove_guest( @guest2 )

  end

end
