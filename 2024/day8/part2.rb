input = 'day8.txt'

puzzle = []

File.foreach(input) do |line|
    clean = line.chomp.split('')
    puzzle << clean
end

puts(puzzle.inspect)

antenna = Hash.new { |h, key| h[key] = [] }

for i in 0...puzzle.length
    for j in 0...puzzle[i].length
        antenna[puzzle[i][j]] << [i, j] if puzzle[i][j] != '.'
    end
end

puts(antenna.inspect)
def within_bound(x, y, row, col)
    return false if x >= row.length || x < 0
    return false if y >= col.length || y < 0

    true
end

result = []
antenna.each do |key, value|
    for i in 0...value.length
        for j in i+1...value.length
            temp_a = value[i]
            temp_b = value[j]

            puts("temp_a: #{temp_a}, #{temp_b}")
            move_a = [temp_a[0] - temp_b[0], temp_a[1] - temp_b[1]]
            move_b = [temp_b[0] - temp_a[0], temp_b[1] - temp_a[1]]

            
            pos_a = [temp_a[0] + move_a[0], temp_a[1] + move_a[1]]
            pos_b = [temp_b[0] + move_b[0], temp_b[1] + move_b[1]]

            while within_bound(pos_a[0], pos_a[1], puzzle, puzzle[0])
                result << pos_a
                pos_a = [pos_a[0] + move_a[0], pos_a[1] + move_a[1]]
            end

            while within_bound(pos_b[0], pos_b[1], puzzle, puzzle[0])
                result << pos_b
                pos_b = [pos_b[0] + move_b[0], pos_b[1] + move_b[1]]
            end

            # if within_bound(pos_a[0], pos_a[1], puzzle, puzzle[0])
            #     result << pos_a
            # end

            # if within_bound(pos_b[0], pos_b[1], puzzle, puzzle[0])
            #     result << pos_b
            # end
        end
    end
    value.each do |num|
        result << num
    end
end

puts(result.inspect)
puts("UNIQQQ")
puts(result.uniq.sort.inspect)
puts(result.length)
puts(result.uniq.length)
# -1, 3

# 1,8
# 2,5

# 1, -4