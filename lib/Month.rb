class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def days?
    days_31 = [1, 3, 5, 7, 8, 10, 12]
    days_30 = [4, 6, 9, 11]
    leap_year = true if @year % 4 == 0
    century_leap_year = true if @year % 100 == 0
    quadcentury_leap_year = true if @year % 400 == 0
    month = @month.to_i
    if days_31.include?(month)
      31
    elsif days_30.include?(month)
      30
    elsif month == 2 && leap_year && !century_leap_year
      29
    elsif month == 2 && quadcentury_leap_year
      29
    elsif month == 2 && century_leap_year && !quadcentury_leap_year
      28
    elsif month == 2 && !leap_year
      28
    else
      "something very wrong happened in Month.days?"
    end
  end

  def start_day_of_week
    if @month.to_i == 1 || @month.to_i == 2
      m = @month.to_i + 12
      y = @year.to_i - 1
    else
      m = @month.to_i
      y = @year.to_i
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

  def to_s
    string = "     #{name} #{@year}\n"
    string << "Su Mo Tu We Th Fr Sa\n"
    string << " 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31"
    puts string
  end
end
