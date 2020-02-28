require("pry-byebug")

class Room

  attr_reader( :guests, :songs, :capacity, :cost )

  def initialize( guests = [], songs = [] )

    @guests = guests
    @songs = songs
    @capacity = 6
    @cost = 1000

  end

  def add_guest( guest )
    if ( capacity_check( @guests) == true )

      @guests.push( guest )

    else
      puts("Room is full")
      return "Room is full"

    end
  end

  def remove_guest( guest )

    @guests.delete( guest )
    # binding.pry()
  end

  def add_song( song )

    @songs.push( song )

  end

  def capacity_check( guests )
    return @capacity > guests.size()
  end
end
