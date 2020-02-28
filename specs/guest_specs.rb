require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )

class GuestTest < Minitest::Test

  def setup

    @guest1 = Guest.new( "Bob McJoe", 10000, "Row Row Row your boat" )

  end

  def test_has_name_money

    assert_equal( "Bob McJoe", @guest1.name())
    assert_equal( 10000, @guest1.money())
    assert_equal( "Row Row Row your boat", @guest1.fave_song)

  end

end
