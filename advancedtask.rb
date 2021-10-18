# in Rainbow: Mon:1000-2000;Tue:1000-2000;Wed:1000-2000;Thu:1000-2000;Fri:1000-1900;Sat:off;Sun:off
# out
# *** Rainbow's hours ***
# Monday - Thursday: 10:00 - 20:00
# Friday: 10:00 - 19:00
# Saturday - Sunday: day off

def two_dots(string)
  "#{string[0..1]}:#{string[2..3]}"
end

def print_day_time(first_day, second_day, time)
  if time == 'off'
    if second_day == ''
      puts "#{first_day}: day off"
    else
      puts "#{first_day} - #{second_day}: days off"
    end
  else
    if second_day == ''
      puts "#{first_day}: #{two_dots(time.split('-')[0])} - #{two_dots(time.split('-')[1])}"
    else
      puts "#{first_day} - #{second_day}: #{two_dots(time.split('-')[0])} - #{two_dots(time.split('-')[1])}"
    end
  end
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
  first_day = ''
  second_day = ''
  first_time = ''
  line.chomp.split(': ')[1].split(';').each do |day_time| # each element with weekday and time day:time
    day = hash[day_time.split(':')[0]]
    time = day_time.split(':')[1]
    if first_day == ''
      first_day = day
      first_time = time
    elsif  first_time == time
      second_day = day
    else
      print_day_time(first_day, second_day, first_time)
      first_day = day
      second_day = ''
      first_time = time
    end
    if day == 'Sunday'
      print_day_time(first_day, second_day, first_time)
    end
  end
end