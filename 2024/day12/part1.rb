input = 'sample.txt'

$puzzle = []
$search_area = [[0,1], [0,-1], [1,0], [-1,0]]

File.foreach(input) do |line|
    clean = line.chomp.split('')
    $puzzle << clean
end

puts $puzzle.inspect

plant_types = Hash.new { |h, key| h[key] = [] }

for x in 0...$puzzle.length
    for y in 0...$puzzle[x].length
        plant_types[$puzzle[x][y]] << [x,y]
    end
end

puts plant_types.inspect

$visited = []
def dfs(coords, num)
    puts("searching at #{coords.inspect} with num: #{num}")
    return [0,1] if coords[0] >= $puzzle.length || coords[0] < 0
    return [0,1] if coords[1] >= $puzzle[0].length || coords[1] < 0
    return [0,1] if $puzzle[coords[0]][coords[1]] != num
    return [0,0] if $visited.include?(coords)

    $visited << coords

    value = [0,0]
    $search_area.each do |x,y|
        temp = dfs([coords[0] + x, coords[1] + y], num)
        value[0] += temp[0]
        value[1] += temp[1]
    end

    # puts("return value #{value} at #{coords.inspect}")
    value[0] += 1
    value
end

result = 0
# puts(dfs([0,0], 'A'))
plant_types.each do |key, value|
    value.each do |c|
        test = dfs(c, key)
        puts("#{key} : #{test.inspect}")

        result += test[0] * test[1]
    end
end

puts result