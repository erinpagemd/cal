class Month
  attr_reader :month, :year

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end

  def days?
    days_31 = [1, 3, 5, 7, 8, 10, 12]
    days_30 = [4, 6, 9, 11]
    if days_31.include?(@month)
      31
    elsif days_30.include?(@month)
      30
    elsif Year.new(@year).leap?
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
    MONTHS[@month]
  end

  def grid
    string = ""
    week4 = ""
    week5 = ""
    week6 = ""
    arr = (1..days?).to_a
    convert_zellers.times do arr.unshift("\s")
    end
    max_weeks_in_month = 6
    days_in_week = 7
    max_arr_length = max_weeks_in_month * days_in_week
    until arr.length == max_arr_length
      arr.push("\s")
    end
    arr[0..6].each {|n| string << "#{n}".center(3)}
    string = string.rstrip
    string << "\n"
    arr[7..13].each {|n| string << "#{n}".center(3)}
    string = string.rstrip
    string << "\n"
    arr[14..20].each {|n| string << "#{n}".center(3)}
    string = string.rstrip
    string << "\n"
    arr[21..27].each {|n| string << "#{n}".center(3)}
    string = string.rstrip
    string << "\n"

    arr[28..34].each {|n| week5 << "#{n}".center(3)}
    string << week5.rstrip
    string << "\n"
    arr[35..-1].each {|n| week6 << "#{n}".center(3)}
    string << week6.rstrip
    string << "\n"
    return string.chomp
  end

  def to_s
    string = "#{name} #{@year}".center(20).rstrip
    string << "\nSu Mo Tu We Th Fr Sa\n"
    string << grid
    string << "\n"
    return string
  end

  private

  def convert_zellers
    if (1..6).include?(start_day_of_week)
      num = start_day_of_week - 1
    elsif start_day_of_week == 0
      num = start_day_of_week + 6
    end
  end
end
