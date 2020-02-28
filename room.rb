class Room

  attr_reader( :guests, :songs )

  def initialize( guests, songs )

    @guests = guests
    @songs = songs

  end

  def add_guest( guest )

    return @guests.push( guest )

  end

  def remove_guest( guest )

    @guests.delete( guest )
    return @guests

  end

end
