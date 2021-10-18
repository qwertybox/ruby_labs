# reads file
lines = [] # contains each line of timetable.txt
File.open("time.txt") do |file|
  lines = file.readlines
end
# hashes
hash = {"Mon" => "Monday", "Tue" => "Tuesday","Wed" => "Wednesday", "Thu"=>"Thursday","Fri"=>"Friday","Sat"=>"Saturday","Sun"=>"Sunday"}
# each line analyse
lines.each do |line|
  puts "***"+line.split(': ')[0]+"***" #returns name
  timetable = line.split(': ')[1].split(';') #day:time
  time = ""
  firstday = ""
  secondday = ""
  #puts timetable
  timetable.each do |day_time| #each element with weekday and time day:time
    currenttime = day_time.split(':')[1].scan(/[0-9][0-9]/).join(':').scan(/[0-9][0-9]:[0-9][0-9]/).join('-')
    currentday = hash[day_time.split(':')[0]]
    # looks for first and second days of repeated time
    #puts "current time "+ currenttime
    if firstday == ""
      firstday = currentday #initialize
      time = currenttime
    elsif currenttime == time
      secondday = currentday
    elsif currenttime !=time && currenttime !=""
      puts firstday +" - "+ secondday + ": "+ time
    else
      puts currentday +": "+ currenttime
    end
  end
end
#input Rainbow: Mon:1000-2000;Tue:1000-2000;Wed:1000-2000;Thu:1000-2000;Fri:1000-1900;Sat:off;Sun:off
# out
# Monday - Thursday: 10:00 - 20:00
# Friday: 10:00 - 19:00
# Saturday - Sunday: day off