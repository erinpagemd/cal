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
    day_names = "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    january = Month.new(1, @year)
    february = Month.new(2, @year)
    string = "#{year}".center(62).rstrip
    string <<"\n\n"
    string << "January".center(20)
    string << "February".center(24)
    string << "March".center(20).rstrip
    string << day_names
    string << january.grid
    string << february.grid
    return string
  end
end
