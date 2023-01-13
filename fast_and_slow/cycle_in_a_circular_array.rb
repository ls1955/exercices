# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  We are given an array containing positive
  and negative numbers. Suppose the array
  contains a number ‘M’ at a particular index.
  Now, if ‘M’ is positive we will move forward
  ‘M’ indices and if ‘M’ is negative move
  backwards ‘M’ indices.
  Write a method to determine if the array has
  a cycle. The cycle should have more than one
  element and should follow one direction which
  means the cycle should not contain both forward
  and backward movements.
STATEMENT

# Solution
class Solution
  def solution(nums)
    nums.each_with_index do |num, i|
      next if num.zero?

      slow = i
      fast = i

      while nums[fast] * nums[slow] > 0 && num * nums[next_index(fast, nums)] > 0
        slow = next_index(slow, nums)
        fast = next_index(next_index(fast, nums), nums)

        if slow == fast
          break if fast == next_index(fast, nums)

          return true
        end
      end

      slow = i

      while num * num[slow] > 0
        next_index_temp = next_index(slow, nums)
        nums[slow] = 0
        slow = next_index_temp
      end
    end

    false
  end

  def next_index(index, nums)
    index += nums[index]
    index += nums.length while index < 0
    index % nums.length
  end

  def educative_solution(nums)
    nums.each_with_index do |num, i|
      forward = (num >= 0)
      slow = i
      fast = i

      loop do
        slow = educative_next_index(nums, forward, slow)
        fast = educative_next_index(nums, forward, fast)
        fast = educative_next_index(nums, forward, fast) unless fast == -1

        break if slow == -1 || fast == -1 || slow == fast
      end

      return true if slow == fast && slow != -1
    end

    false
  end

  def educative_next_index(nums, forward, index)
    direction = (nums[index] >= 0)

    return -1 unless direction == forward

    next_index = (index + nums[index]) % nums.length

    return -1 if next_index == index

    next_index % nums.length
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.educative_solution([1, 2, -1, 2, 2])
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.educative_solution([2, 2, -1, 2])
    expected = true

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.educative_solution([2, 1, -1, -2])
    expected = false

    assert_equal(expected, solution)
  end
end
