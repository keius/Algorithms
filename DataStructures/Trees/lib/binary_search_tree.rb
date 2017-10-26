require 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    # setting the root here in case it is still nil
    @root = insert_into_tree(@root, value)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
  end

  def maximum(tree_node = @root)
    return nil if tree_node.nil?
    if tree_node.right
      maximum(tree_node.right)
    else
      return tree_node
    end
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    left = depth(tree_node.left)
    right = depth(tree_node.right)

    return 1 + [left, right].max
  end

  def is_balanced?(tree_node = @root)

  end

  def in_order_traversal(tree_node = @root, arr = [])
    # left children, itself, right children
  end



  private

  def insert_into_tree(tree_node, value)
    return BSTNode.new(value) if tree_node.nil?

    if value < tree_node.value
      tree_node.left = insert_into_tree(tree_node.left, value)
    else
      tree_node.right = insert_into_tree(tree_node.right, value)
    end

    tree_node
  end

  def delete_from_tree(tree_node, value)
    # if correct node is found, then call remove on it.
    # otherwise, recurse until you find it
    remove(tree_node) if tree_node.value == value
    if value < tree_node.value
      delete_from_tree(tree_node.left, value)
    else
      delete_from_tree(tree_node.right, value)
    end

    tree_node
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.right && node.left.nil?
      node = node.right
    else
      replace_parent(node)
    end

    node
  end

  def replace_parent(node)


    # since the replacement_node is still pointing to its old children,
    # we have to update its children pointers

  end

  def promote_child(tree_node)

  end
end
