require("pry-byebug")

class Room

  attr_reader( :guests, :songs )

  def initialize( guests = [], songs = [] )

    @guests = guests
    @songs = songs

  end

  def add_guest( guest )

    @guests.push( guest )

  end

  def remove_guest( guest )

    @guests.delete( guest )
    # binding.pry()
  end

  def add_song( song )

    @songs.push( song )

  end
end
