class Bar

attr_reader(:till)

  def initialize(till)

    @till = till

  end

  def check_till
    return @till
  end


  def add_money_to_till()
    return @till += rooms.roomprice()
  end

  def pay_room()
    @till.add_money_to_till(rooms.roomprice())
    guests.remove_money_from_wallet(rooms.roomprice())
  end


end  ##### CLASS END
