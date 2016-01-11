class ProgrammingLanguage
  attr_accessor :name, :age, :type

  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

def array_printer(array)
  array.each do |language|
    puts "Language: #{language.name} Age: #{language.age} Type: #{language.type}"
  end
end

ruby = ProgrammingLanguage.new('Ruby', 21, 'Dynamic')
python = ProgrammingLanguage.new('Python', 24, 'Dynamic')
javascript = ProgrammingLanguage.new('Javascript', 20, 'Dynamic')
go = ProgrammingLanguage.new('Go', 6, 'Static')
rust = ProgrammingLanguage.new('Rust', 5, 'Static')
swift = ProgrammingLanguage.new('Swift', 2, 'Static')
java = ProgrammingLanguage.new('Java', 20, 'Static')

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

# array_printer(array_of_languages)

older_languages = array_of_languages.map do |language|
  language.age += 1
  language
end

# array_printer(older_languages)

sorted_languages = array_of_languages.sort do |first, after|
  after.age <=> first.age
end

# array_printer(sorted_languages)

# dfarray = array_of_languages.delete_if {|language|
#   language.name == "Java"
# }

# array_printer(dfarray)

# daarray = array_of_languages.delete_at(-1)

# array_printer(daarray)

shuffle_array = array_of_languages.shuffle

array_printer(shuffle_array)

# a = array_of_languages.map {|language| language.age}
# b = a.combination(4).to_a.to_s
# puts b
