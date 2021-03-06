class Year
  attr_reader :year

  def initialize(year)
    @year = year.to_i
  end

  def leap?
    if @year % 4 == 0 && @year % 100 != 0
      true
    elsif @year % 400 == 0
      true
    else
      false
    end
  end

  def to_s
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    day_names = "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    month_grids = []
    [1,2,3,4,5,6,7,8,9,10,11,12].each do |m|
      month_grids.push(Month.new(m, @year))
    end
    month_grids.map! {|m| m = m.grid}
    month_grids.each do |m|
      max_weeks_in_month = 6
      days_in_week = 7
      chars_per_day = 3
      max_string_length = max_weeks_in_month * days_in_week * chars_per_day - 1
      until m.length == max_string_length
        m << "\s"
      end
    end
    string = "#{year}".center(62).rstrip + "\n"
    left = 0
    middle = 1
    right = 2
    until left == 12 do
      string << "\n"
      string << month_names[left].center(20)
      string << month_names[middle].center(24)
      string << month_names[right].center(20).rstrip
      string << day_names
      6.times do
        row = "\n"
        row << month_grids[left].slice!(0..20).tr("\n", "").center(20)
        row << month_grids[middle].slice!(0..20).tr("\n", "").center(24)
        row << month_grids[right].slice!(0..20).tr("\n", "").center(20)
        row = row.rstrip
        if row.empty?
          string << "\n"
        else
          string << row
        end
      end
      left += 3
      middle += 3
      right += 3
    end
    return string + "\n"
  end
end
