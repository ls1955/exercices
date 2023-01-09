# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Any number will be called a happy number if,
  after repeatedly replacing it with a number
  equal to the sum of the square of all of its
  digits leads us to number ‘1’. All other
  numbers will be stuck in a cycle of numbers
  which does not include ‘1’.
STATEMENT

# Solution
class Solution
  def solution(num)
    successor = ->(num) { num.digits.sum { |digit| digit**2 } }

    slow = num
    fast = num

    until fast == 1 || successor.call(fast) == 1
      slow = successor.call(slow)
      fast = successor.call(successor.call(fast))

      return false if slow == fast
    end

    true
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution(23)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution(12)
    expected = false

    assert_equal(expected, solution)
  end
end
