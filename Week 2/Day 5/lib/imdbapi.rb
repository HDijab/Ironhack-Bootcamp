require 'imdb'
# require './randomword'
# require 'pry'


# BE VERY CAREFUL WITH THREADING - READ ABOUT IT FIRST #########
class ImdbApi
  def initialize(search, args={})
    @object = Imdb::Search.new(search).movies.to_enum
    @list_of_movies = {}
    @value_a = args[:first] || :id
    @value_b = args[:second] || :poster
    @amount = args[:amount] || 9
    @counter = 0
  end

  def filter_movies
      while @counter < @amount
        thread
        sleep (rand(0)/10.0)
      end
      @object.rewind
      @counter = 1
  end

  def get_list
    filter_movies
    @list_of_movies
  end

  private

  def thread
    current = @object.next
    Thread.new {
    @list_of_movies[current.send(@value_a)] = current.send(@value_b)
    @list_of_movies.reject! {|k,v| k == nil || v == nil} or @counter += 1
    }
  end
end

# TESTING ########
# args = {first: :title, second: :genres, amount: 25}
# word = RandomWord.pick_random_word
# puts word
# sample = ImdbApi.new(word)
# t = Time.now
# test = sample.get_list
# puts test.length
# time = Time.now - t
# puts time
# binding.pry