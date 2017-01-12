require_relative 'integer_to_english'
require 'minitest'
require 'minitest/autorun'

class IntegerToEnglishTest < Minitest::Test

  def setup
    integers_to_english = {
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

    tens = [20, 30, 40, 50, 60, 70, 80, 90]

    @converted_to_english = []

    (1..19).each do |i|
      @converted_to_english << integers_to_english[i]
    end

    tens.each do |ten|
      @converted_to_english << integers_to_english[ten]
      (1..9).each { |s| @converted_to_english <<  integers_to_english[ten] + integers_to_english[s]  }
    end

    @numbers_with_decimals = []
    (1..99).each { |i| @numbers_with_decimals << i + 0.12345 }

    @numbers_outside_range = [100, 200.102, -100, -200.102]
  end

  def test_positive_numbers
    (1..99).each do |i|
      assert_equal @converted_to_english[i - 1], EnglishNumber.new(i).in_english
    end
  end

  def test_negative_numbers
    (-1..-99).each do |i|
      assert_equal @converted_to_english[i - 1], EnglishNumber.new(i).in_english
    end
  end

  def test_numbers_with_decimals
    @numbers_with_decimals.each do |i|
      assert_equal @converted_to_english[i - 1], EnglishNumber.new(i).in_english
    end
  end

  def test_numbers_outside_range
    @numbers_outside_range.each do |i|
      assert_nil EnglishNumber.new(i).in_english
    end
  end

end
