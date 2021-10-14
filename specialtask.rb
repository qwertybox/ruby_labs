#in Rainbow: Mon:1000-2000;Tue:1000-2000;Wed:1000-2000;Thu:1000-2000;Fri:1000-1900;Sat:off;Sun:off
# out
# *** Rainbow’s hours ***
# Monday: 10:00 - 20:00
# Tuesday: 10:00 - 20:00
# Wednesday: 10:00 - 20:00
# Thursday: 10:00 - 20:00
# Friday: 10:00 - 19:00
# Saturday: day off
# Sunday: day off
lines = [] # contains each line of timetable.txt
File.open("timetable.txt") do |file|
  lines = file.readlines
end
hash = {"Mon" => "Monday", "Tue" => "Tuesday","Wed" => "Wednesday", "Thu"=>"Thursday","Fri"=>"Friday","Sat"=>"Saturday","Sun"=>"Sunday"}
lines.each do |line|
  puts "***"+line.split(': ')[0]+"***" #returns name
  timetable = line.split(': ')[1].split(';')
  timetable.each do |day_time| #each element with weekday and time day:time
    if day_time.split(':')[1].scan(/[0-9][0-9]/).join(':')[0].class == NilClass
      puts hash[day_time.split(':')[0]] + ": " + "day off"
    else
      puts hash[day_time.split(':')[0]] +": "+ day_time.split(':')[1].scan(/[0-9][0-9]/).join(':').scan(/[0-9][0-9]:[0-9][0-9]/).join('-')
    end
  end
end
