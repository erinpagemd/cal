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
    month_grids = []
    [1,2,3,4,5,6,7,8,9,10,11,12].each do |m|
      month_grids.push(Month.new(m, @year))
    end
    month_grids.map! {|m| m = m.grid}
    month_grids.each do |m|
      until m.length == 126
        m << " "
      end
    end
    string = "#{year}".center(62).rstrip
    string <<"\n\n"
    string << "January".center(20) + "February".center(24) + "March".center(20).rstrip
    string << day_names
    6.times do
      string << month_grids[0].slice!(0..20).chomp + "  " + month_grids[1].slice!(0..20).chomp + "  " + month_grids[2].slice!(0..20)
    end
    6.times do
      string << month_grids[3].slice!(0..20).chomp + "  " + month_grids[4].slice!(0..20).chomp + "  " + month_grids[5].slice!(0..20)
    end
    6.times do
      string << month_grids[6].slice!(0..20).chomp + "  " + month_grids[7].slice!(0..20).chomp + "  " + month_grids[8].slice!(0..20)
    end
    6.times do
      string << month_grids[9].slice!(0..20).chomp + "  " + month_grids[10].slice!(0..20).chomp + "  " + month_grids[11].slice!(0..20)
    end
    return string
  end
end
