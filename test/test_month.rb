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

  def test_name
    m = Month.new(05, 1979)
    assert_equal "May", m.name
  end

  def test_31_days?
    m = Month.new(01, 2014)
    assert_equal 31, m.days?
  end

  def test_30_days?
    m = Month.new(11, 2014)
    assert_equal 30, m.days?
  end

  def test_28_century_leap_year_days?
    m = Month.new(02, 3000)
    assert_equal 28, m.days?
  end

  def test_28_normal_days?
    m = Month.new(02, 1999)
    assert_equal 28, m.days?
  end

  def test_29_quadcentury_leap_year_days?
    m = Month.new(02, 2000)
    assert_equal 29, m.days?
  end

  def test_start_day_of_week
  end

end
