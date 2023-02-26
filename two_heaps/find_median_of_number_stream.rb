# frozen_string_literal: false

require 'algorithms'
require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Design a class to calculate the median
  of a number stream. The class should have
  the following two methods:

    insert(num): stores the number
    median: returns the median of all inserted numbers

  If the count of numbers inserted is even,
  the median will be the average of the middle two numbers.
STATEMENT

# Solution
class MedianFinder
  include Containers

  attr_accessor :left_part, :right_part

  def initialize
    @left_part = MaxHeap.new
    @right_part = MinHeap.new
  end

  def insert(num)
    left_part << num
    right_part << (left_part.pop)

    left_part << (right_part.pop) if left_part.length < right_part.length
  end

  def median
    left_part.length > right_part.length ?
    left_part.next :
    (left_part.next + right_part.next).fdiv(2)
  end
end

# Tests
class MedianFinderTest < Minitest::Test
  def test_insert_nums_and_find_medians
    median_finder = MedianFinder.new

    median_finder.insert(3)
    median_finder.insert(1)

    assert_equal(2, median_finder.median)

    median_finder.insert(5)

    assert_equal(3, median_finder.median)

    median_finder.insert(4)

    assert_equal(3.5, median_finder.median)
  end
end
