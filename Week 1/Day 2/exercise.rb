require 'pry'
class Blog
  def initialize
    @posts = []
  end

  def start
    page = 0
    choice = nil
    until choice == 'quit'
      publish_page(page)
      print '> '
      choice = gets.chomp.downcase
      case choice
      when 'next'
        page += 3 unless check_page(page, choice)
      when 'prev'
        page -= 3 unless check_page(page, choice)
      when 'quit'
      else
        puts "Sorry, I don't understand"
        sleep(1)
      end
    end
  end

  def check_page(pgnum, direction)
    return true if pgnum == 0 && direction == 'prev'
    return true if pgnum == (@posts.size - (@posts.size % 3)) && direction == 'next'
    return false
  end

  def publish_page(pgnum)
    system("clear")
    puts
    @posts.slice(pgnum, 3).each do |post|
      puts post.title
      puts '**********'
      puts post.text
      puts '----------'
    end
    puts
    ((@posts.size % 3) + 1).times { |i| print "#{i + 1} " }
    puts "\n\n"
  end

  def add_post(post)
    @posts << post
    @posts.sort_by!(&:date).reverse
  end
end

class Post
  attr_reader :title, :text, :date
  def initialize(title, text)
    @title = title
    @text = text
    @date = Time.now
  end
end

class SponsoredPost < Post
  def initialize(title, text)
    super(title, text)
    @title = @title.center(30, '*')
  end
end

blog = Blog.new

8.times do |i|
  blog.add_post(Post.new("Post #{i + 1} Title", "post #{i + 1} text"))
end

blog.start
