
class EnglishNumber

   def initialize(integer)
   		if integer < 100.0 or integer > -100.0
        integer = turn_negative_to_positive(integer)
        @integer = round_of_if_necessary(integer)
   		else
        @integer = nil
      end
   end

	def in_english
		unless @integer.nil?
			if @integer > 19 then whole, remain = split_to_ten(@integer) else whole, remain = @integer end
		end

    integers_to_english = { # Could have probably done this with YAML.
        90 => "ninety",
        80 => "eighty",
        70 => "seventy",
        60 => "sixty",
        50 => "fifty",
        40 => "forty",
        30 => "thirty",
        20 => "twenty",
        19 => "nineteen",
        18 => "eighteen",
        17 => "seventeen", 
        16 => "sixteen",
        15 => "fifteen",
        14 => "fourteen",
        13 => "thirteen",              
        12 => "twelve",
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
	    	@integer # Example => nil
	    elsif integers_to_english[remain].nil?
	    	return integers_to_english[whole] # Example 1 => one, 19 => nineteen
	    else 
	    	return integers_to_english[whole] + integers_to_english[remain] # Example twenty + two => twentytwo
	    end
	end

	private

  def turn_negative_to_positive(integer)
    if integer > 0 then integer else integer = -integer end # Example 5 => -5
  end

  def round_of_if_necessary(integer)
    unless integer % 1 == 0 then integer=round_numbers(integer) else integer end # Example 9 => 9, 9.5 => 9, 9.6 => 10
  end

  def round_numbers(i)
  	number = i.to_s.split(".") # Example 24.5 => ["24","5"]
  	decimal = ("0." + number[1].to_s).to_f # => 0.5
  	if decimal <= 0.5 then i = number[0].to_i else i = number[0].to_i + 1 end # => 24
  end

  def split_to_ten(integer) # Used to avoid repetition in integers_to_english.
  	remain = integer % 10 # Example 19 => 10
    integer_rounded_down_to_closest_ten = integer - remain # Example => 9
  	return integer_rounded_down_to_closest_ten, remain # Example => ["10","9"]
  end

end
