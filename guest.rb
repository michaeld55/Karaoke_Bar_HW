class Guest

  attr_reader( :name, :money, :fave_song )
  attr_writer( :money )

  def initialize( name, money, fave_song = "" )

    @name = name
    @money = money
    @fave_song = fave_song
  end

end
