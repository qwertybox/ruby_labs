class ScedulerParser
  def initialize(path)
    readfile path
  end

  def parse_file
    # implement method
  end

  def print
    # implement method
  end

  protected
  WEEKDAYS = {
    Mon: 'Monday',
    Tue: 'Tuesday',
    Wed: 'Wednesday',
    Thu: 'Thursday',
    Fri: 'Friday',
    Sat: 'Saturday',
    Sun: 'Sunday'
  }.freeze

  private
  def readfile(path)
    file = File.open(path)
    @lines = file.read
    file.close
  end
end

class ShopParser < ScedulerParser

  def parse_file
    @parced_file = {}
    @lines.each_line do |line|
      name, time_line = name_scedule(line)
      @parced_file[name] = time_line
    end
    puts @parced_file
  end

  def print
    @parced_file.each_pair do |name, schedule|
      puts "***#{name}***"
      prnt_daytime(schedule)
    end
  end

  private

  def prnt_daytime(timeline)
    timeline.each do |day_time|
      day_time.each_pair do |day, time|
        day = WEEKDAYS[day.to_sym]
        if time[0] == ''
          puts "#{day}: day off"
          next
        end
        puts "#{day}: #{time[0]} - #{time[1]}"
      end
    end
  end

  #[name], [timeline]
  # timeline = {Monday,[t1,t2]}, {Tuesday,[t1,t2]}.....
  def name_scedule(line)
    name = line.chomp.split(': ')[0]
    timeline = parse_timeline(line.chomp.split(': ')[1].split(';'))
    return name, timeline
  end

  # return {Monday,[t1,t2]}, {Tuesday,[t1,t2]}....
  def parse_timeline(days_times)
    timelin_arr = []
    days_times.each do |day_time|
      day = parse_day(day_time)
      times = parse_time(day_time.split(':')[1])
      timelin_arr << {"#{day}" => times}
    end
    timelin_arr
  end

  def parse_day(day_time)
    day_time.split(':')[0]
  end

   def parse_time(time)
    return '', '' if time == 'off'
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