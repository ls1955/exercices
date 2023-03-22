# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/array_reader'

class ArrayReaderTest < Minitest::Test
  def test_initialize
    nums = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    reader = ArrayReader.new nums

    assert_equal reader.arr, nums
  end

  def test_get_elements
    reader = ArrayReader.new [0, 1, 2, 3, 4, 5, 6, 7, 8]

    (0..8).each do |index|
      assert_equal reader.get(index), index
    end
  end

  def test_get_elements_with_alias
    reader = ArrayReader.new [0, 1, 2, 3, 4, 5, 6, 7, 8]

    (0..8).each do |index|
      assert_equal reader[index], index
    end
  end

  def test_get_out_of_bound_element
    reader = ArrayReader.new [0, 1, 2, 3, 4, 5, 6, 7, 8]
    num = reader.get 999

    assert_equal Float::INFINITY, num
  end

  def test_get_element_at_infinity
    reader = ArrayReader.new [0, 1, 2, 3, 4, 5, 6, 7, 8]
    num = reader.get Float::INFINITY

    assert_equal Float::INFINITY, num
  end
end
