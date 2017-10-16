require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @max = max
    @prc = prc
    @store = LinkedList.new
    @map = HashMap.new
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    node = @store.append(key, val)
    @map[key] = node

    eject! if count > @max
    val
  end

  def update_node!(node)
    node.remove
    @store.append(node.key, node.val)
  end

  def eject!
    remove_node = @store.first
    remove_node.remove
    @map.delete(remove_node.key)

    nil
  end
end
