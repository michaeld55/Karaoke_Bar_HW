require("pry-byebug")

class Room

  attr_reader( :guests, :songs, :capacity, :cost, :till )

  def initialize( guests = [], songs = [] )

    @guests = guests
    @songs = songs
    @capacity = 6
    @cost = 1000
    @till = 0

  end

  def add_guest( guest )
    if ( capacity_check( @guests ) == true )
      # binding.pry
      charge( guest )
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

  def charge( guest )

    guest.money -= @cost
    @till += @cost

  end

  def fave_song_in_room( guest )
    # binding.pry
    if  @songs.find{ |song| song.name == guest.fave_song}
      puts( "WHOO this is my jam" )
      return "WHOO this is my jam"
    else
      puts( "Aww they don't have my song" )
      "Aww they don't have my song"
    end
  end
end
