class Guests

  attr_reader :name, :favouritesong, :wallet

  def initialize(name, favouritesong, wallet)

    @name = name
    @favouritesong = favouritesong
    @wallet = wallet

  end

  def check_guests_name
    return @name
  end

  def check_favourite_song
    return @favouritesong
  end

  def check_wallet_content
    return @wallet
  end

  def remove_money_from_wallet(amount)
    return @wallet -= amount
  end

end  #CLASS END 
