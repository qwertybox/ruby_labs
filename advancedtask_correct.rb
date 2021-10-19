# in Rainbow: Mon:1000-2000;Tue:1000-2000;Wed:1000-2000;Thu:1000-2000;Fri:1000-1900;Sat:off;Sun:off
# out
# *** Rainbow's hours ***
# Monday - Thursday: 10:00 - 20:00
# Friday: 10:00 - 19:00
# Saturday - Sunday: day off

def clear_week(week)
  # clearing
  week
end

def show_schedule(first, second, time)
  if time == 'off'
    day_off(first, second)
    return
  end
  work_day(first, second, time)
end

def day_off(first, second)
  if second.empty?
    puts "#{first}: day off"
    return
  end
  puts "#{first} - #{second}: days off"
end

def work_day(first, second, time)
  if second.empty?
    puts "#{first}: #{two_dots(time.split('-')[0])} - #{two_dots(time.split('-')[1])}"
    return
  end
  puts "#{first} - #{second}: #{two_dots(time.split('-')[0])} - #{two_dots(time.split('-')[1])}"
end

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

if !information.empty?
  information.each_line do |line|
    first_day = ''
    second_day = ''
    last_time = ''
    week = line.chomp.split(': ')[1].delete(' ').split(';')
    puts "*** #{line.split(': ')[0]} ***" # returns name
    clear_week(week)
    week.each do |day_time| # each element with weekday and time day:time
      current_day = hash[day_time.split(':')[0]]
      current_time = day_time.split(':')[1]
      if first_day == ''
        first_day = current_day
        last_time = current_time
      elsif last_time == current_time
        second_day = current_day
      else
        show_schedule(first_day, second_day, last_time)
        first_day = current_day
        second_day = ''
        last_time = current_time
      end
      show_schedule(first_day, second_day, last_time) if current_day == 'Sunday'
    end
  end
else
  throw "You have empty line"
end

