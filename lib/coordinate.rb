# frozen_string_literal: true

# A 2d coordinate on the graph
class Coordinate
  class << self
    def euclidean_distance(coor_arr)
      Integer.sqrt(coor_arr[0]**2 + coor_arr[1]**2)
    end

    alias e_dist euclidean_distance
  end

  attr_accessor :x, :y

  def initialize(x: :x_not_set , y: :y_not_set)
    @x = x
    @y = y
  end

  def to_a
    [x, y]
  end
end
