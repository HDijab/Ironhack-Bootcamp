class Parser
  attr_reader :tweets
  def initialize(file)
    @file = file
    @tweets = {}
  end

  def parse
    File.open(@file).readlines.each do |line|
      name = line.match(/^\w+:\s/).to_s
      name.chop!.chop!
      name = name.to_sym
      mentions = line.scan(/@\w+/)
      mentions.map! do |mention|
        mention.delete! '@'
        mention = mention.to_sym
      end
      if @tweets.has_key?(name)
        @tweets[name] << mentions
      else
        @tweets[name] = mentions
      end
    end
    @tweets.each do |key, value|
      @tweets[key].flatten!
      @tweets[key].uniq!
    end
  end
end