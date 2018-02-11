require('minitest/autorun')
require_relative('../guests')
require_relative('../rooms')



class GuestsTest < MiniTest::Test


  def setup()

    @guest1 = Guests.new("Antonio", "Alleluya", 50.00)
    # @guest2 = Guests.new("Paul", "Aleluya")

  end
  def test_check_guests_name
    assert_equal("Antonio", @guest1.check_guests_name())
  end

  def test_check_favourite_song
    assert_equal("Alleluya", @guest1.check_favourite_song())
  end

  def test_check_wallet_content
    assert_equal(50.00, @guest1.check_wallet_content())
  end

  def test_remove_money_from_wallet
    @guest1.remove_money_from_wallet(10.55)
    assert_equal(39.45, @guest1.wallet())
  end


end  # CLASS END
