class Shorter < ActiveRecord::Base

	def self.shorten
		range = *("a".."z")
		range2 = *("A".."Z")
		range += range2
		range.flatten!

		a = range[rand(52)]
		b = range[rand(52)]
		c = range[rand(52)]

		short = a + b + c
		short
	end

	def self.store(long, short)
		short_store = Shorter.find_by("long_url == ?", long)
		unless short_store
			Shorter.create(long_url: long, short_url: short)
			true
		else
			false
		end
	end

end
