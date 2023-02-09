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
end
