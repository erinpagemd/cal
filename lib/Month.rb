class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
    if @year < 1800 || @year > 3000
      error_message
      exit
    elsif @month <= 0
      error_message
      exit
    end

  end

  def days?
    days_31 = [1, 3, 5, 7, 8, 10, 12]
    days_30 = [4, 6, 9, 11]
    @year = @year.to_i
    leap_year = true if @year % 4 == 0
    century_leap_year = true if @year % 100 == 0
    quadcentury_leap_year = true if @year % 400 == 0
    month = @month.to_i
    if days_31.include?(month)
      31
    elsif days_30.include?(month)
      30
    elsif month == 2 && leap_year && !century_leap_year && !quadcentury_leap_year
      29
    elsif month == 2 && leap_year && century_leap_year && quadcentury_leap_year
      29
    elsif month == 2 && leap_year && century_leap_year && !quadcentury_leap_year
      28
    elsif month == 2 && !leap_year
      28
    else
      "something very wrong happened in Month.days?"
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

    # 3 = March
    # 4 = April
    # 5 = May
    # 6 = June
    # 7 = July
    # 8 = August
    # 9 = September
    #10 = October
    #11 = November
    #12 = December
    #13 = January
    #14 = February

    # 0 = Saturday
    # 1 = Sunday
    # 2 = Monday
    # 3 = Tuesday
    # 4 = Wednesday
    # 5 = Thursday
    # 6 = Friday

    #ZellersCongruence info found at http://en.wikipedia.org/wiki/Zeller's_congruence
    day_of_week = (1 + (((m + 1) * 26) / 10).floor + y + (y / 4).floor + (6 * (y / 100).floor) + (y / 400).floor) % 7

  end

  def name
    months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_index = @month.to_i
    month_name = months[month_index]
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

    if start_day_of_week == 2
      arr.unshift(" ")
      # 2 == Monday
    elsif start_day_of_week == 3
      arr.unshift(" ").unshift(" ")
      # 3 == Tuesday
    elsif start_day_of_week == 4
      arr.unshift(" ").unshift(" ").unshift(" ")
      # 4 == Wednesday
    elsif start_day_of_week == 5
      arr.unshift(" ").unshift(" ").unshift(" ").unshift(" ")
      # 5 == Thursday
    elsif start_day_of_week == 6
      arr.unshift(" ").unshift(" ").unshift(" ").unshift(" ").unshift(" ")
      # 6 == Friday
    elsif start_day_of_week == 0
      arr.unshift(" ").unshift(" ").unshift(" ").unshift(" ").unshift(" ").unshift(" ")
      # 0 == Saturday
    else
      arr
    end

    # populate week nums based on position in the array

    week1_nums = arr[0..6].each {|n| week1 << "#{n}".center(3)}
    week2_nums = arr[7..13].each {|n| week2 << "#{n}".center(3)}
    week3_nums = arr[14..20].each {|n| week3 << "#{n}".center(3)}
    week4_nums = arr[21..27].each {|n| week4 << "#{n}".center(3)}

    string << "#{week1.rstrip}\n"
    string << "#{week2.rstrip}\n"
    string << "#{week3.rstrip}\n"
    string << "#{week4.rstrip}\n"

    if arr.length > 34
      week5_nums = arr[28..34].each {|n| week5 << "#{n}".center(3)}
      week6_nums = arr[35..-1].each {|n| week6 << "#{n}".center(3)}
      string << "#{week5.rstrip}\n"
      string << "#{week6.rstrip}"
    else
      week5_nums = arr[28..-1].each {|n| week5 << "#{n}".center(3)}
      string << "#{week5.rstrip}"
    end
    return "#{string.rstrip}\n"
  end

  def to_s
    string = "#{name} #{@year}".center(20).rstrip
    string << "\nSu Mo Tu We Th Fr Sa\n"
    string << grid
    puts string
  end

  def error_message
    print "Date not in acceptable format/range."
  end

end
