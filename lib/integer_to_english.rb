require 'pry'

class EnglishNumber

   def initialize(integer)
   		if integer > 99 or integer < -99
   			@integer = nil
   		else
   			if integer > 0 then else integer = -integer end # Turns negative numbers to positive
      	@integer=round_numbers(integer)
      end
   end

	def in_english
		unless @integer.nil?
			if @integer > 19 then whole, remain = split_to_ten(@integer) else whole, remain = @integer end
		end
	  integers_to_english = {
	      100 => "hundred",
	      90 => "ninety",
	      80 => "eighty",
	      70 => "seventy",
	      60 => "sixty",
	      50 => "fifty",
	      40 => "forty",
	      30 => "thirty",
	      20 => "twenty",
	      19=>"nineteen",
	      18=>"eighteen",
	      17=>"seventeen", 
	      16=>"sixteen",
	      15=>"fifteen",
	      14=>"fourteen",
	      13=>"thirteen",              
	      12=>"twelve",
	      11 => "eleven",
	      10 => "ten",
	      9 => "nine",
	      8 => "eight",
	      7 => "seven",
	      6 => "six",
	      5 => "five",
	      4 => "four",
	      3 => "three",
	      2 => "two",
	      1 => "one",
	    }
	    if @integer.nil?
	    	puts @integer
	    else
	    	if integers_to_english[remain].nil?
	    		puts integers_to_english[whole]
	    	else 
	    		puts integers_to_english[whole] + integers_to_english[remain]
	    	end
	    end
	end

	private

  def round_numbers(i)
  	number = i.to_s.split(".") # Example 24.5 => ["24","5"]
  	decimal = ("0." + number[1].to_s).to_f # => 0.5
  	if decimal <= 0.5 then i = number[0].to_i else i = number[0].to_i + 1 end
  end

  def split_to_ten(integer)
  	closest_ten = integer.round(-1)
  	remain = integer - closest_ten
  	return closest_ten, remain
  end

end

#EnglishNumber.new(6).in_english # => 'six'
#EnglishNumber.new(6.5).in_english # => 'six'
#EnglishNumber.new(-10.5).in_english # => 'ten'
#EnglishNumber.new(-100).in_english # => 'ten'

EnglishNumber.new(6).in_english # => 'six'
EnglishNumber.new(22).in_english # => 'eleven'
EnglishNumber.new(22).in_english # => 'twenty-two'
EnglishNumber.new(24.5).in_english # => 'twenty-four'
EnglishNumber.new(101).in_english # => nil
#binding.pry