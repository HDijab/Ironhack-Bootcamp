# class User
#   attr_reader :password
#   def initialize(password)
#     @password = password
#   end

#   def password_enter(password)
#     Validator.new(self, password).validate
#   end
# end

# class Validator
#   def initialize(user, password)
#     @user = user
#     @password = password
#   end

#   def validate
#     @password == @user.password
#   end
# end

# class Action
#   def initialize(text)
#     @text = text
#   end

#   def count
#     puts "Your phrase is #{@text.length} characters long"
#   end
# end

# user = User.new('1234')
# puts "Please enter your password:"
# if user.password_enter(gets.chomp)
#   puts 'Enter phrase:'
#   Action.new(gets.chomp).count
# else
#   puts'Password is incorrect'
# end
