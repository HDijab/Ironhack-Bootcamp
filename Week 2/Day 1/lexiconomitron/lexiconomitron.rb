class Lexiconomitron
  def eat_t(phrase)
  	return phrase.gsub(/t/, '').gsub(/T/, '')
  end

  def shazam(array)
    array.map! do |string|
      string = eat_t(string.reverse!)
    end
    array.slice!(1..-2)
    array
  end

  def oompa_loompa(array)
    array.select do |string|
      eat_t(string) if string.length <= 3
    end
  end
end