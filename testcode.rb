require 'byebug'

def unique_paths_with_obstacles(obstacle_grid)
    m = obstacle_grid.length
    n = obstacle_grid[0].length
    graph = Array.new(m) { Array.new(n) }
    graph[0][0] = obstacle_grid[0][0] == 1 ? 0 : 1
    print graph

    (0...m).each do |row|
        (0...n).each do |col|
            left = graph[row - 1][col] || 0
            top = graph[row][col - 1] || 0
            graph[row][col] = obstacle_grid[row][col] == 1 ? 0 : left + top
        end
    end

    graph[m - 1][n - 1]
end

print unique_paths_with_obstacles([[0]])
