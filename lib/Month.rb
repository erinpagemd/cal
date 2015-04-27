class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
    if @year < 1800 || @year > 3000 || @month <= 0 || @month > 12
      error_message
      exit
    end
  end

  def days?
    days_31 = [1, 3, 5, 7, 8, 10, 12]
    days_30 = [4, 6, 9, 11]
    leap_year = true if @year % 4 == 0
    century_leap_year = true if @year % 100 == 0 && leap_year
    quadcentury_leap_year = true if @year % 400 == 0 && century_leap_year
    if days_31.include?(@month)
      31
    elsif days_30.include?(@month)
      30
    elsif @month == 2 && leap_year && !century_leap_year || @month == 2 && quadcentury_leap_year
      29
    else
      28
    end
  end

  def start_day_of_week
    if @month == 1 || @month == 2
      m = @month + 12
      y = @year - 1
    else
      m = @month
      y = @year
    end
    #ZellersCongruence info found at http://en.wikipedia.org/wiki/Zeller's_congruence
    day_of_week = (1 + (((m + 1) * 26) / 10).floor + y + (y / 4).floor + (6 * (y / 100).floor) + (y / 400).floor) % 7
  end

  def name
    months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_name = months[@month]
  end

  def grid
    string = ""
    week1 = ""
    week2 = ""
    week3 = ""
    week4 = ""
    week5 = ""
    week6 = ""
    arr = (1..days?).to_a
    if (2..6).include?(start_day_of_week)
      num = start_day_of_week - 1
      num.times do arr.unshift(" ")
      end
    elsif start_day_of_week == 0
      num = start_day_of_week + 6
      num.times do arr.unshift(" ")
      end
    end
    arr[0..6].each {|n| week1 << "#{n}".center(3)}
    arr[7..13].each {|n| week2 << "#{n}".center(3)}
    arr[14..20].each {|n| week3 << "#{n}".center(3)}
    arr[21..27].each {|n| week4 << "#{n}".center(3)}
    string << "#{week1.rstrip}\n"
    string << "#{week2.rstrip}\n"
    string << "#{week3.rstrip}\n"
    string << "#{week4.rstrip}\n"
    if arr.length > 35
      arr[28..34].each {|n| week5 << "#{n}".center(3)}
      arr[35..-1].each {|n| week6 << "#{n}".center(3)}
      string << "#{week5.rstrip}\n"
      string << "#{week6.rstrip}"
      return "#{string}"
    elsif arr.length == 28
      string << "#{week5}\n"
      return "#{string}"
    else
      arr[28..-1].each {|n| week5 << "#{n}".center(3)}
      string << "#{week5.rstrip}"
      return "#{string.rstrip}\n"
    end
  end

  def to_s
    string = "#{name} #{@year}".center(20).rstrip
    string << "\nSu Mo Tu We Th Fr Sa\n"
    string << grid
    print string
  end

  private
  def error_message
    print "Date not in acceptable format/range."
  end
end
