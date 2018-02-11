require('minitest/autorun')
require_relative('../songs')


class SongsTest < MiniTest::Test

  def setup()
    @ReggaeSong1 = Songs.new("Buffalo Soldier")
    # @ReggaeSong2 = Songs.new("Legalize it")
    # @ReggaeSong3 = Songs.new("Alleluya")
    # @PopSong1= Songs.new("Rock your body")
    # @PopSong2= Songs.new("Beat it")
    # @PopSong3= Songs.new("Anything but love")
    # @LoveSong1= Songs.new("Nothing like you")
    # @LoveSong2= Songs.new("Only you")
    # @LoveSong3= Songs.new("I will die for you")
  end


  def test_check_song_name
    assert_equal("Buffalo Soldier", @ReggaeSong1.check_song_name())
  end



end # CLASS END
