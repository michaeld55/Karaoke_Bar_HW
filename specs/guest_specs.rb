require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )

class GuestTest < Minitest::Test

  def setup

    @guest1 = Guest.new( "Bob McJoe" )

  end

  def test_has_name

    assert_equal( "Bob McJoe", @guest1.name())

  end

end
