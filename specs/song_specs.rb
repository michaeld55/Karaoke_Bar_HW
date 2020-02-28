require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../song.rb' )

class SongTest < Minitest::Test

  def setup

    @song1 = Song.new( "Row Row Row your boat" )

  end

  def test_has_name()

     assert_equal( "Row Row Row your boat", @song1.name())

  end

end
