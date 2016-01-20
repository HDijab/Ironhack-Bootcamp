class Lexiconomitron
  attr_reader :words
  def initialize(letter, words)
    @letter = letter.downcase
    @words = words
    eat_letter
  end

  def iterate(iterator, block)
    @words.send(iterator, &block)
  end

  def shazam
    change = iterate(:map, :reverse)
    [change[0], change[-1]]
  end

  def oompa_loompa
    three = proc {yield itself < 3}
    iterate(:select, three)
  end

  def all_in_line(words, delimiter)
    words.sort_by! { |word| word.size }.reverse!
    line = words.join(delimiter)

    line.downcase.tr(@letter, "")
  end

  def supercounter(words)
    words = eat_letter(words.join(""))

    sum = 0
    (0.upto(words.size-1)).each do |letter_index|
      if before_letter?(words[letter_index])
        sum += 1
      end
    end
    sum
  end

  private

  def eat_letter
    iterate(:map!, :downcase)
    words.map! {|word| word.tr(@letter, "")}
  end

  def before_letter?(letter)
    if alphabet.index(letter.downcase) < alphabet.index(@letter)
      return true
    end
    false
  end

  def alphabet
    "abcdefghijklmnopqrstuvwxyz"
  end
end

lexi = Lexiconomitron.new('t', %w(one two three four))
puts lexi.shazam
puts lexi.words
puts
puts lexi.oompa_loompa