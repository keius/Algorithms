require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root
      BinarySearchTree.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value
    if value < tree_node.value
      return nil unless tree_node.left
      find(value, tree_node.left)
    else
      return nil unless tree_node.right
      find(value, tree_node.right)
    end
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  # helper method for #delete:
  def self.delete_min!(node)
    return nil unless node
    if node.left == BinarySearchTree.min(node)
      node.left = node.left.right
    else
      BinarySearchTree.delete_min!(node.left)
    end
  end

  def self.delete!(node, value)
    return nil unless node

    if node.value < value
      node.right = BinarySearchTree.delete!(node.right, value)
    elsif node.value > value
      node.left = BinarySearchTree.delete!(node.left, value)
    else
      return node.left unless node.right
      return node.right unless node.left

      target = node
      node = target.right.min
      node.right = BinarySearchTree.delete_min!(target.right)
      node.left = target.left
    end
    node
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
    return unless node
    if value > node.value
      if node.right
        BinarySearchTree.insert!(node.right, value)
      else
        node.right = BSTNode.new(value)
      end
    else
      if node.left
        BinarySearchTree.insert!(node.left, value)
      else
        node.left = BSTNode.new(value)
      end
    end
  end

  def empty?(node)
    node.left.nil? && node.right.nil?
  end
end
