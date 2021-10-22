# in Rainbow: Mon:1000-2000;Tue:1000-2000;Wed:1000-2000;Thu:1000-2000;Fri:1000-1900;Sat:off;Sun:off
# out
# *** Rainbow's hours ***
# Monday: 10:00 - 20:00
# Tuesday: 10:00 - 20:00
# Wednesday: 10:00 - 20:00
# Thursday: 10:00 - 20:00
# Friday: 10:00 - 19:00
# Saturday: day off
# Sunday: day off
#
class FirstPart
  def initialize
    readfile
    @weekdays = {
      'Mon' => 'Monday',
      'Tue' => 'Tuesday',
      'Wed' => 'Wednesday',
      'Thu' => 'Thursday',
      'Fri' => 'Friday',
      'Sat' => 'Saturday',
      'Sun' => 'Sunday'
    }.freeze
  end

  def show_timetable
    @information.each_line do |line|
      @shop_name = line.split(': ')[0] #  name
      line.chomp.split(': ')[1].split(';').each do |day_time| # each element with weekday and time day:time
        @day = @weekdays[day_time.split(':')[0]]
        @time = day_time.split(':')[1]
        printrez
      end
    end
  end

  private
  def readfile
    file = File.open('timetable.txt')
    @information = file.read
    file.close
  end

  def putdots(string)
    "#{string[0..1]}:#{string[2..3]}"
  end

  def printrez
    puts "*** #{@shop_name} ***"
    if @time == 'off'
      puts "#{@day}: day off"
    else
      puts "#{@day}: #{putdots(@time.split('-')[0])} - #{putdots(@time.split('-')[1])}"
    end
  end
end

MyCLass = FirstPart.new
MyCLass.show_timetable