input = 'day10.txt'

$puzzle = []

File.foreach(input) do |line|
    $puzzle << line.chomp.split('')
end

puts $puzzle.inspect

$search_area = [[0,1], [0,-1], [1,0], [-1,0]]
start_points = []

for i in 0...$puzzle.length
    for j in 0...$puzzle[i].length
       start_points << [i, j] if $puzzle[i][j] == '0'
    end
end

puts(start_points.inspect)
puts(start_points.length)

$visited = []

def dfs(coords, num)
    puts("searching at #{coords.inspect} with num: #{num}")
    return 0 if coords[0] >= $puzzle.length || coords[0] < 0
    return 0 if coords[1] >= $puzzle[0].length || coords[1] < 0
    return 0 if $puzzle[coords[0]][coords[1]].to_i != num
    if $puzzle[coords[0]][coords[1]] == '9' && !$visited.include?(coords)
        # puts("found 9 at #{coords.inspect}")
        $visited << coords
        return 1
    end

    new_num = num + 1
    value = 0
    $search_area.each do |x,y|
        # new_coords = coords.dup
        # new_coords[0] += x
        # new_coords[1] += y
        # puts("searching at #{new_coords.inspect} with num: #{new_num}")
        value += dfs([coords[0] + x, coords[1] + y], new_num)
    end

    # puts("return value #{value} at #{coords.inspect}")
    value
end


results = 0
start_points.each do |start_x, start_y|
    results += dfs([start_x, start_y], 0)
end

puts(results)

# puts("result: #{dfs([0,2], 0)}")