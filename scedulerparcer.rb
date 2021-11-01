require 'json'
class SchedulerParser
  attr_reader :parsed_file, :lines

  def initialize(path)
    readfile(path)
  end

  def print
    @parsed_file.each_pair do |name, schedule|
      puts "***#{name}***"
      print_daytime(schedule)
    end
  end

  private
  def print_daytime(timeline)
    timeline.each do |day_time|
      day_time.each_pair do |day, time|
        day = WEEKDAYS[day.to_sym]
        if time[0] == '' # add new method for this
          puts "#{day}: day off"
          next
        end
        puts "#{day}: #{time[0]} - #{time[1]}"
      end
    end
  end


  WEEKDAYS = {
    Mon: 'Monday',
    Tue: 'Tuesday',
    Wed: 'Wednesday',
    Thu: 'Thursday',
    Fri: 'Friday',
    Sat: 'Saturday',
    Sun: 'Sunday'
  }.freeze


  def parse_file
    # implement method exc
  end

  private
  def readfile(path)
    file = File.open(path)
    @lines = file.read
    file.close
  end
end

class ShopParser < SchedulerParser

  def parse_file
    @parsed_file = {}
    @lines.each_line do |line|
      line = Split_method(line) if line.include? ':  '
      name, time_line = name_scedule(line)
      @parsed_file[name] = time_line
    end
    puts @parsed_file.to_json
  end

  private
  def Split_method(line)
    line.split(':  ')[1]
  end
  #[name], [timeline]
  # timeline = {Monday,[t1,t2]}, {Tuesday,[t1,t2]}.....
  def name_scedule(line)
    name = line.chomp.split(': ')[0]
    puts name
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
    [time1, time2]
  end

  def putdots(string)
    "#{string[0..1]}:#{string[2..3]}"
  end
end

class BusParser < SchedulerParser

  def parse_file
    @parsed_file = {}
    @lines.each_line do |line|
      line = Split_method(line) if line.include? ':  '
      name, time_line = name_scedule(line)
      @parsed_file[name] = time_line
    end
  end

  private
  def Split_method(line)
    line.split(':  ')[1]
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
    [time1, time2]
  end

  def putdots(string)
    "#{string[0..1]}:#{string[2..3]}"
  end
end

class SchedulerFactory
  CLASS_TYPES = {
    type_1: ShopParser,
    type_2: BusParser
  }.freeze

  def self.create_for(path)
    type_line = first_line(path)
    scheduler_class(type_line).new(path)
  end

  def self.first_line (path)
    file = File.open(path)
    type_line = file.readline
    file.close
    type_line
  end

  def self.scheduler_class(type_line)
    class_type = type_line.split(':  ')[0].to_sym
    CLASS_TYPES[class_type]
  end
end
# TODO: str contains type symbol change ShopParser
path = 'timetable.txt'
scedule = ShopParser.new(path)
scedule.parse_file
scedule.print
path = 'time.txt'
scedule_2 = SchedulerFactory.create_for(path)
scedule_2.parse_file
scedule_2.print
# structure for second class