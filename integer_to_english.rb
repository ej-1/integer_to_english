require 'bigdecimal'

class EnglishNumber
  INTEGER_TO_ENGLISH_HASH = {
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
  }.freeze # Freeze to lock the value, since in Ruby you can change constants.

  MINIMUM_VALUES = -100.0.freeze
  MAXIMUM_VALUES = 100.0.freeze

  def initialize(integer)
    if integer < MAXIMUM_VALUES or integer > MINIMUM_VALUES # (-100..100) === integer # range
      integer = integer.abs # turns to positive value
      @integer = round_numbers(integer)
    else
      @integer = nil
    end
  end

  def in_english
    unless @integer.nil?
      if @integer > 19 then whole, remain = split_to_ten(@integer) else whole, remain = @integer end
    end

    if @integer.nil?
      @integer # Example => nil
    elsif INTEGER_TO_ENGLISH_HASH[remain].nil?
      return INTEGER_TO_ENGLISH_HASH[whole] # Example 1 => one, 19 => nineteen
    else 
      return INTEGER_TO_ENGLISH_HASH[whole] + INTEGER_TO_ENGLISH_HASH[remain] # Example twenty + two => twentytwo
    end
  end

  private

  def round_numbers(i)
    #i % 1 <= 0.5 ? i.floor : i.ceil #ANOTHER SOLUTION
    s = BigDecimal.new(i.to_s)
    s.round(0, :half_up).to_i # https://ruby-doc.org/stdlib-1.9.3/libdoc/bigdecimal/rdoc/BigDecimal.html#method-c-mode
  end

  def split_to_ten(integer) # Used to avoid repetition in integers_to_english.
    ten = integer / 10 * 10 # Example 19 => 10
    remain = integer % 10 # Example 19 => 9
    return ten, remain # Example => ["10","9"]
  end

end
