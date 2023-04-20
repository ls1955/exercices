# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/coordinate'

class CoordinateTest < Minitest::Test
  def test_static_euclidean_distance
    distance1 = Coordinate.euclidean_distance([1, 2])
    distance2 = Coordinate.euclidean_distance([3, 5])

    assert_equal(2, distance1)
    assert_equal(5, distance2)
  end

  def test_initialize
    coor = Coordinate.new(x: 1, y: 1)

    assert_equal(1, coor.x)
    assert_equal(1, coor.y)
  end

  def test_to_a
    coor = Coordinate.new(x: 1, y: 2)

    assert_equal([1, 2], coor.to_a)
  end
end
