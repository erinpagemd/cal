require_relative 'helper'
require_relative '../lib/Year'

class TestYear < Minitest::Test

  def test_init_saves_year
    y = Year.new(2015)
    assert_equal 2015, y.year
  end

  def test_non_leap_year_leap?
    y = Year.new(2015)
    assert_equal false, y.leap?
  end

  def test_regular_leap_year_leap?
    y = Year.new(1992)
    assert_equal true, y.leap?
  end

  def test_century_leap_year_leap?
    y = Year.new(2500)
    assert_equal false, y.leap?
  end

  def test_quadcentury_leap_year_leap?
    y = Year.new(2400)
    assert_equal true, y.leap?
  end
end
