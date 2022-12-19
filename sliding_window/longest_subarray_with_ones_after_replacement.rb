# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Problem Statement #
  Given an array containing 0s and 1s,
  if you are allowed to replace no more than ‘k’ 0s with 1s,
  find the length of the longest contiguous subarray having all 1s.
HEREDOC

# Solution
class Solution
  def solution(nums, k)
    left = 0
    replaced_amount = 0

    nums.each_with_index.reduce(0) do |max_length, (num, right)|
      replaced_amount += 1 if num.zero?

      while replaced_amount > k
        replaced_amount -= 1 if nums[left].zero?

        left += 1
      end

      [max_length, right - left + 1].max
    end
  end

  def solution_ver2(nums, k)
    left = 0
    right = 0
    replaced_amount = 0

    nums.length.times do
      replaced_amount += 1 if nums[right].zero?

      if replaced_amount > k
        replaced_amount -= 1 if nums[left].zero?

        left += 1
      end

      right += 1
    end

    right - left
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1], 2)

    assert_equal(6, solution)
  end

  def test_case2
    solution = Solution.new.solution([0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1], 3)

    assert_equal(9, solution)
  end
end
