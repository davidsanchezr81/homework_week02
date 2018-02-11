require('minitest/autorun')
require_relative('../bar')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')


class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new(150)
    @room6 = Rooms.new("Reggae", 20, 100)
    @guest16 = Guests.new("Bob", "Yes I like it", 50.00)

  end


  def test_check_till
    assert_equal(150, @bar.check_till())
  end

  def test_add_money_to_till
    @room6.add_money_to_till()
    assert_equal(120, @room6.till())
  end

  def test_pay_room
    @guest16.pay_room(@room6)
    assert_equal(30, @guests16.wallet())
    assert_equal(120, @room6.till())
  end

end # CLASS END
