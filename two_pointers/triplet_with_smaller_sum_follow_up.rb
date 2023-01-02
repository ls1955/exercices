# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Triplet with smaller sum follow up:
  Write a function to return the list
  of all such triplets instead of the
  count. How will the time complexity
  change in this case?
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    triplet_lists = []
    nums.sort!

    (nums.length - 2).times do |i|
      left = i + 1
      right = nums.length - 1

      while left < right
        curr_sum = nums[i] + nums[left] + nums[right]

        if curr_sum < target
          right.downto(left + 1) do |last_num_ptr|
            triplet_lists << [nums[i], nums[left], nums[last_num_ptr]]
          end

          left += 1
        else
          right -= 1
        end
      end
    end

    triplet_lists
  end

  def brute_force(nums, target)
    triplet_lists = []

    (nums.length - 2).times do |i|
      ((i + 1)...(nums.length - 1)).each do |j|
        ((j + 1)...(nums.length)).each do |k|
          curr_sum = nums[i] + nums[j] + nums[k]

          triplet_lists << [nums[i], nums[j], nums[k]] if curr_sum < target
        end
      end
    end

    # since the output order matter,
    # this won't return the exact result.
    triplet_lists
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-1, 0, 2, 3], 3)
    expected = [[-1, 0, 3], [-1, 0, 2]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([-1, 4, 2, 1, 3], 5)
    expected = [[-1, 1, 4], [-1, 1, 3], [-1, 1, 2], [-1, 2, 3]]

    assert_equal(expected, solution)
  end
end
