require 'rspec'
require './rspec_exercise'

describe "FizzBuzz" do
	before :each do
		@subject = FizzBuzz.new
	end

	it "returns Fizz when number % 3 == 0" do
		result = @subject.normalize(3)
		expect(result).to eq("Fizz")
	end

	it "returns Buzz when number % 5 == 0" do
		result = @subject.normalize(5)
		expect(result).to eq("Buzz")
	end

	it "returns Buzz when number % 7 == 0" do
		result = @subject.normalize(7)
		expect(result).to eq("Dude")
	end

	it "returns FizzBuzz when number % 15 == 0" do
		result = @subject.normalize(15)
		expect(result).to eq("FizzBuzz")
	end

	it "returns number when number % 15 != 0" do
		result = @subject.normalize(2)
		expect(result).to eq(2)
	end
end