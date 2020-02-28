class Room

  attr_reader( :guests, :songs )

  def initialize( guests, songs )

    @guests = guests
    @songs = songs

  end

  def add_guest( guest )

    return @guests.push( guest )

  end

end
