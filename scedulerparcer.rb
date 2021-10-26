class ScedulerParser
  WEEKDAYS = {
    'Mon' => 'Monday',
    'Tue' => 'Tuesday',
    'Wed' => 'Wednesday',
    'Thu' => 'Thursday',
    'Fri' => 'Friday',
    'Sat' => 'Saturday',
    'Sun' => 'Sunday'
  }.freeze

  def initialize(path)
    readfile path
  end

  def parse_file
    # implement method
  end

  def print
    # implement method
  end

  private

  def readfile(path)
    file = File.open(path)
    @lines = file.read
    file.close
  end
end

class ShopParser < ScedulerParser

  def parse_file
    @rezult = {}
    @lines.each_line do |line|
      name, time_line = name_scedule(line)
      @rezult[name] = time_line#@rezult << {'name' => name, 'time_line' => time_line
    end
    puts @rezult
  end

  def print
    @rezult.each_pair do |name, schedule|
      puts "***#{name}***"
      prnt_daytime(schedule)
    end
  end

  private

  def prnt_daytime(timeline)
    timeline.each do |day_time|
      day_time.each_pair do |day, time|
        day = WEEKDAYS[day]
        if time[0] == 'off'
          puts "#{day}: day off"
          next
        end
        puts "#{day}: #{time[0]} - #{time[1]}"
      end
    end
  end

  def name_scedule(line)
    name = line.chomp.split(': ')[0] #  name
    timeline = parse_timeline(line.chomp.split(': ')[1].split(';'))
    #[name], [timeline]
    # timeline = {Monday,[t1,t2]}, {Tuesday,[t1,t2]}.....
    return name, timeline
  end

  def parse_timeline(days_times) # array day:time
    # return {Monday,[t1,t2]}, {Tuesday,[t1,t2]}....
    timelin_arr = []
    days_times.each do |day_time|
      day = parse_day(day_time) # returns day
      times = parse_time(day_time.split(':')[1])# returns [t1,t2]
      timelin_arr << {"#{day}" => times}
    end
    timelin_arr
  end

  public def parse_day(day_time)
    day_time.split(':')[0]
  end

   def parse_time(time)
    return 'off', 'off' if time == 'off'
    time1 = putdots(time.split('-')[0])
    time2 = putdots(time.split('-')[1])
    return time1, time2
  end

  def putdots(string)
    "#{string[0..1]}:#{string[2..3]}"
  end
end

path = 'timetable.txt'
scedule = ShopParser.new path
scedule.parse_file
scedule.print