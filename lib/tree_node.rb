# frozen_string_literal: false

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = -1, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def append_left(node)
    @left = node
    self
  end

  def append_right(node)
    @right = node
  end

  def each_level_arr
    queue = [self]

    until queue.empty?
      yield queue if block_given?
      queue.map! { |node| [node.left, node.right].compact }.flatten!
    end
    self
  end

  def each_level_arr_with_index
    queue = [self]
    index = 0

    until queue.empty?
      yield(queue, index) if block_given?
      queue.map! { |node| [node.left, node.right].compact }.flatten!
      index += 1
    end
    self
  end

  def height
    result = 0
    each_level_arr { result += 1 }
    result
  end

  def leaf?
    !left && !right
  end

  def level_order_traversal
    result = []
    each_level_arr { |level| result << level.map(&:val) }
    result
  end

  def to_s
    "(#{val})"
  end
end
