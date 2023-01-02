# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given two strings containing backspaces
  (identified by the character ‘#’), check
  if the two strings are equal.
STATEMENT

# Solution
class Solution
  def solution(str1, str2)
    str1_ptr = str1.length - 1
    str2_ptr = str2.length - 1
    str1_skip_amount = 0
    str2_skip_amount = 0

    while str1_ptr >= 0 && str2_ptr >= 0
      while str1_ptr >= 0
        if str1[str1_ptr] == '#'
          str1_skip_amount += 1
          str1_ptr -= 1
        elsif str1_skip_amount.positive?
          str1_skip_amount -= 1
          str1_ptr -= 1
        else
          break
        end
      end

      while str2_ptr >= 0
        if str2[str2_ptr] == '#'
          str2_skip_amount += 1
          str2_ptr -= 1
        elsif str2_skip_amount.positive?
          str2_skip_amount -= 1
          str2_ptr -= 1
        else
          break
        end
      end

      return false if str1[str1_ptr] != str2[str2_ptr]

      str1_ptr -= 1
      str2_ptr -= 1
    end

    true
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('xy#z', 'xzz#')
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution('xy#z', 'xyz#')
    expected = false

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution('xp#', 'xyz##')
    expected = true

    assert_equal(expected, solution)
  end

  def test_case4
    solution = Solution.new.solution('xywrrmp', 'xywrrmu#p')
    expected = true

    assert_equal(expected, solution)
  end
end
