class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def to_s
    months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_index = @month.to_i
    month_name = months[month_index]
    puts <<EOS
     #{month_name} #{@year}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
  end
end
