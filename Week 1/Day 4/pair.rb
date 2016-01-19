require 'pry'
require 'date'
class Parser
  attr_reader :split
  def initialize(file)
    @file = file
    @split = []
  end

  def parse
    split = {}
    File.open(@file).each do |line|
      if line.strip == ''
      elsif (line.strip[/^[0-9]*$/])
        split[:index] = line.strip
      elsif (line.strip[/^[0-9]/]) && (line.strip[/[^A-Za-z0-9[:blank:]]/])
        split[:datetime] = line.strip
      end
      if split.has_key?(:datetime)
        @split << split
        split = {}
      end
    end
  end

  def translate
    @split.each do |hash|
      times = hash[:datetime].split(' ')
      start_time = DateTime.parse(times[0], "%H:%M:%S,%3N")
      end_time = DateTime.parse(times[2]).to_time + 2
      puts start_time
      puts end_time
    end
  end
end

parser = Parser.new('Mr.Robot.S01E02.HDTV.x264-KILLERS.srt')
parser.parse
parser.translate
