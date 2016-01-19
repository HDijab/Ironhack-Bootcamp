APP_ROOT = File.dirname(__FILE__)

$LOAD_PATH << File.join(APP_ROOT, 'lib')

require 'pry'
require 'parser'
require 'socials'
require 'names'

parser = Parser.new('complex-input.txt')
parser.parse
socials = Socials.new(parser.tweets)
collection = []
parser.tweets.each do |key, value|
  collection << Names.new(key, value)
end 
socials.first
collection.each do |object|
  object.connections
end