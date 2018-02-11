class Rooms

  attr_reader(:roomtype, :numberofguests, :numberofsongs, :waitinglist, :roomprice, :till, :wallet)

  def initialize (roomtype, numberofguests = [], numberofsongs = [], waitinglist = [], roomprice, till)

    @roomtype = roomtype
    @numberofguests = numberofguests
    @numberofsongs = numberofsongs
    @waitinglist = waitinglist
    @roomprice = roomprice
    @till = till


  end

  def check_room_type
    @roomtype
  end


  def add_guests_to_room(guests)
    @numberofguests.push(guests)
  end

  def remove_guests_from_room(guests)
    @numberofguests.delete(guests)
  end

  def add_song_to_room(songs)
    @numberofsongs.push(songs)
  end

  def room_is_full()
    return @numberofguests.count() == 4
  end

  def add_guest_to_waiting_list(guests)
    @waitinglist.push(guests)
  end

  def remove_guest_from_waiting_list(guests)
    @waitinglist.delete(guests)
  end

  def automatic_waiting_list(guest)
    if room_is_full()
      add_guest_to_waiting_list(guest)
    else
      add_guests_to_room(guest)
    end
  end

  def add_money_to_till()
    return @till += roomprice
  end



end  # CLASS END
