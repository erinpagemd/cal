require_relative 'helper'
require_relative '../lib/Month'

class TestMonth < Minitest::Test

  def test_initializing_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_to_s_feb_2012
    m = Month.new(03, 2012)
    assert_equal 03, m.month
    assert_equal 2012, m.year
  end

  def test_to_s_jan_2017
    m = Month.new(01, 2017)
    assert_equal 01, m.month
    assert_equal 2017, m.year
  end

end
