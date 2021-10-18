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

def two_dots(string)
  "#{string[0..1]}:#{string[2..3]}"
end

hash = {
  'Mon' => 'Monday',
  'Tue' => 'Tuesday',
  'Wed' => 'Wednesday',
  'Thu' => 'Thursday',
  'Fri' => 'Friday',
  'Sat' => 'Saturday',
  'Sun' => 'Sunday'
}

file = File.open('timetable.txt')
information = file.read
file.close

information.each_line do |line|
  puts "*** #{line.split(': ')[0]} ***" # returns name

  line.chomp.split(': ')[1].split(';').each do |day_time| # each element with weekday and time day:time
    day = hash[day_time.split(':')[0]]
    time = day_time.split(':')[1]
    if time == 'off'
      puts "#{day}: day off"
    else
      puts "#{day}: #{two_dots(time.split('-')[0])} - #{two_dots(time.split('-')[1])}"
    end
  end
end