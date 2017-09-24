require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)

  end

  def find(value, tree_node = @root)

  end

  def delete(value)
  end

  # helper method for #delete:
  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    BinarySearchTree.min(node.left)
  end

  def maximum(tree_node = @root)
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || empty?(tree_node)
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  def is_balanced?(tree_node = @root)
    ((depth(tree_node.left) - depth(tree_node.right)).abs == 1) &&
    is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    in_order_traversal(tree_node.left) + [tree_node.value] + in_order_traversal(tree_node.right)
  end


  private
  # optional helper methods go here:
  def self.insert!(node, value)

  end

  def empty?(node)
    node.left.nil? && node.right.nil?
  end
end
