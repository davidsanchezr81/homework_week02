require('minitest/autorun')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')


class RoomsTest < MiniTest::Test

  def setup()
    @room1 = Rooms.new("Reggae", 10, 100)
    @room2 = Rooms.new("Pop", 12, 125)
    @room3 = Rooms.new("Love", 15, 150)

    ########## SONGS for REGGAE ROOM #####################
    @ReggaeSong1 = Songs.new("Buffalo Soldier")
    @ReggaeSong2 = Songs.new("Legalize it")
    @ReggaeSong3 = Songs.new("Alleluya")
    @ReggaeSong4 = Songs.new("Pray Jah")
    songs_reggae_room =[@ReggaeSong1, @ReggaeSong2, @ReggaeSong3, @ReggaeSong4]
    ################ SONGS for POP ROOM ##################
    @PopSong1= Songs.new("Rock your body")
    @PopSong2= Songs.new("Beat it")
    @PopSong3= Songs.new("Anything but love")
    @PopSong4= Songs.new("Party night")
    songs_pop_room =[@PopSong1, @PopSong2, @PopSong3, @PopSong4]
    ################# SONGS for LOVE ROOM ################
    @LoveSong1= Songs.new("Nothing like you")
    @LoveSong2= Songs.new("Only you")
    @LoveSong3= Songs.new("I will die for you")
    @LoveSong4= Songs.new("Solo tu")
    songs_love_room =[@LoveSong1, @LoveSong2, @LoveSong3, @LoveSong4]
    ############### Guests for REGGAE ROOM ###############
    @guest1 = Guests.new("Antonio", "Alleluya", 50.00)
    @guest2 = Guests.new("Paul", "Buffalo Soldier", 40.50)
    @guest3 = Guests.new("Maria", "Legalize it", 130.00)
    @guest4 = Guests.new("Pedro", "Pray Jah", 34.80)
    guests1 = [@guest1, @guest2, @guest3, @guest4]

    @fullreggaeroom = Rooms.new("Reggae", songs_reggae_room, guests1, 10, 225)

    ################ Guests for POP ROOM ##################
    @guest5 = Guests.new("Juan", "Rock your body", 24.5)
    @guest6 = Guests.new("Gabriel", "Beat it", 45.00)
    @guest7 = Guests.new("Jose", "Anything but love", 46.70)
    @guest8 = Guests.new("David", "Party night", 560.00)
    guests2 = [@guest5, @guest6, @guest7, @guest8]

    @fullpoproom = Rooms.new("Pop", songs_pop_room, guests2, 12, 145)

    ################ Guests for LOVE ROOM #################
    @guest9 = Guests.new("Teresa", "Nothing like you", 24.00)
    @guest10 = Guests.new("Elisol", "I will always love you", 57.00)
    @guest11 = Guests.new("Natascha", "I will die for you", 43.90)
    @guest12 = Guests.new("Daniel", "Solo tu", 23.00)
    guests3 = [@guest9, @guest10, @guest11, @guest12]

    ################ Waiting Guests for ALL ROOMS #################
    @guest13 = Guests.new("George", "Redemption Song", 45.00)
    @guest14 = Guests.new("Katy", "Bad", 56.00)
    @guest15 = Guests.new("Karl", "El Amante", 45.00)


    @fullroom = Rooms.new("Love", [@guest9, @guest10, @guest11, @guest12], 12, 150)

    @nonfullroom = Rooms.new("Love", [@guest10, @guest11], 12, 135)

    #Room with empty waiting list
    @room4 = Rooms.new("Love", [@guest9, @guest10, @guest11, @guest12],["Nothing like you"],[], 12, 146)
    #Room with waiting list
    @room5 = Rooms.new("Love", [@guest9, @guest10, @guest11, @guest12],["Nothing like you"],[@guest15], 12, 345)

    @room7 = Rooms.new("Love", [@guest9, @guest10, @guest11, @guest12], ["Nothing like you", "I will always love you", "I will die for you", "Solo tu"], [@guest15], 12, 345)


  end

  #######################  TESTING ########################

  # ---------------------- BASICS ------------------------
  # CHECK ROOM TYPE
  def test_check_room_type
    assert_equal("Reggae", @room1.check_room_type())
  end

  # CHECK IN
  def test_add_guests_to_room
    @room1.add_guests_to_room(@guest1)
    assert_equal(1, @room1.numberofguests().count())
  end

  # CHECK OUT
  def test_remove_guests_from_room
    @occupiedroom = Rooms.new("Reggae",[@guest1], 10)
    @occupiedroom.remove_guests_from_room(@guest1)
    assert_equal(0, @occupiedroom.numberofguests().count())
  end
  #
  # ADD SONG TO ROOM
  def test_add_song_to_room
    @room1.add_song_to_room(@ReggaeSong1)
    assert_equal(1, @room1.numberofsongs().count())
  end
  #
  # # ---------------------- EXTENSIONS ----------------------
  #
  # VERIFY IF ROOM IS FULL
  def test_room_is_full__true
    assert_equal(true, @fullroom.room_is_full())
  end

  def test_room_is_full__false
    assert_equal(false, @nonfullroom.room_is_full())
  end

  # ADD GUESTS TO WAITING LIST
  def test_add_guess_to_waiting_list
    @room4.add_guest_to_waiting_list(@guest13)
    assert_equal(1, @room4.waitinglist().count())
  end

  # REMOVE GUESTS FROM WAITING LIST
  def test_remove_guess_from_waiting_list
    @room5.remove_guest_from_waiting_list(@guest15)
    assert_equal(0, @room5.waitinglist().count())
  end

  # -------- AUTOMATIC WAITING LIST --------
  # IT ADDS GUESTS TO THE WAITING LIST ONLY IF THE ROOM IS FULL

  def test_automatic_waiting_list__room_full_add_guest
    @room4.automatic_waiting_list(@guest13)
    assert_equal(1, @room4.waitinglist.count())
  end

  def test_automatic_waiting_list__non_room_full_add_guest
    @nonfullroom.automatic_waiting_list(@guest15)
    assert_equal(3, @nonfullroom.numberofguests.count())
    assert_equal(0, @nonfullroom.waitinglist.count())
  end

  def test_add_money_to_till
    @room1.add_money_to_till()
    assert_equal(110, @room1.till())
  end


# # ---------------------- ADVANCED EXTENSIONS ----------------------

  # --------   CELEBRATE THE FAVOURITE SONG AVAILABLE --------


  def test_check_favourite_song__yes
    @rooms7.check_favourite song(@LoveSong1)
    assert_equal("Whoo",  )
  end



end  #### CLASS END
