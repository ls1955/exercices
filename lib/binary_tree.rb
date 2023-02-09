# frozen_string_literal: false

require_relative 'tree_node'

class BinaryTree
  def self.with(vals)
    build(vals.flatten)
  end

  def self.build(vals)
    nodes = vals.map { |val| TreeNode.new(val) if val }
    root = nodes[0]

    (1...nodes.length).each do |index|
      next unless nodes[index]

      parent_index = (index - 1) / 2
      parent = nodes[parent_index]
      link_nodes(parent, nodes[index], index)
    end
    root
  end

  def self.link_nodes(parent, child, index)
    index.odd? ? parent.left = child : parent.right = child
  end
end
