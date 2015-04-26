require_relative 'helper'

class TestCalIntegration < Minitest::Test

  def test_month_starting_sunday
    output = `./cal.rb 07 2012`
    expected = <<EOS
     July 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, output
  end

  def test_regular_leap_year
    output = `./cal.rb 02 1996`
    expected = <<EOS
   February 1996
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29

EOS
    assert_equal expected, output
  end

  def test_century_leap_year
    output = `./cal.rb 02 3000`
    expected = <<EOS
   February 3000
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
    assert_equal expected, output
  end

  def test_400_year_leap_year
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    assert_equal expected, output
  end

  def test_month_january
    output = `./cal.rb 01 2014`
    expected = <<EOS
    January 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_month_february_normal
    output = `./cal.rb 02 1999`
    expected = <<EOS
   February 1999
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28

EOS
    assert_equal expected, output
  end

  def test_month_march_six_weeks
    output = `./cal.rb 03 2024`
    expected = <<EOS
     March 2024
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS
    assert_equal expected, output
  end

  def test_month_april_without_leading_zero
    output = `./cal.rb 4 1856`
    expected = <<EOS
     April 1856
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_month_may
    output = `./cal.rb 05 1979`
    expected = <<EOS
      May 1979
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_month_june
    output = `./cal.rb 06 1902`
    expected = <<EOS
     June 1902
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
    assert_equal expected, output
  end

  def test_month_july
    output = `./cal.rb 07 1925`
    expected = <<EOS
     July 1925
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_month_august
    output = `./cal.rb 08 1949`
    expected = <<EOS
    August 1949
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_month_september
    output = `./cal.rb 09 1958`
    expected = <<EOS
   September 1958
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30

EOS
    assert_equal expected, output
  end

  def test_month_october_six_weeks
    output = `./cal.rb 10 1976`
    expected = <<EOS
    October 1976
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS
    assert_equal expected, output
  end

  def test_month_november
    output = `./cal.rb 11 1983`
    expected = <<EOS
   November 1983
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_month_december
    output = `./cal.rb 12 2108`
    expected = <<EOS
   December 2108
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS
    assert_equal expected, output
  end

  def test_minimum_date
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_maximum_date
    output = `./cal.rb 12 3000`
    expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_too_early_date
    skip
    output = `./cal.rb 12 1779`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_too_late_date
    skip
    output = `./cal.rb 01 3001`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_error_alpha_month
    skip
    output = `./cal.rb April 2490`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_error_year_before_month
    skip
    output = `./cal.rb 2590 04`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_error_one_input_month
    skip
    output = `./cal.rb 06`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_error_one_input_month
    skip
    output = `./cal.rb 2690`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_valid_month_invalid_year
    skip
    output = `./cal.rb 03 9I40`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_input_invalid_month_valid_year
    skip
    output = `./cal.rb -1 2980`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

  def test_octonumber
    skip
    output = `.cal.rb 09 2012`
    expected = "Date not in acceptable format/range."
    assert_equal expected, output
  end

end
