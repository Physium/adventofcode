input = 'day6.txt'

puzzle = []

File.foreach(input) do |line|
    clean = line.chomp.split('')
    puzzle << clean
end

$guard_position = nil
for i in 0...puzzle.length
    for j in 0...puzzle[i].length
        $guard_position = [i,j] if puzzle[i][j] == '^'
    end
end

def puzzle_traverse(puzzle, ideal_path)
    direction = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    visited = []
    cur_direction = 0
    row, col = $guard_position[0], $guard_position[1]
    endless = false

    while row < puzzle.length && col < puzzle[row].length && row >= 0 && col >= 0
        if !ideal_path.nil? && ideal_path.length * 2 == visited.length
            endless = true
            break
        end
        if puzzle[row][col] == '#'
            row, col = row - direction[cur_direction][0], col - direction[cur_direction][1]
            if cur_direction == direction.length - 1
                # puts('reseting direction')
                cur_direction = 0
            else
                cur_direction += 1
            end

            row, col = row + direction[cur_direction][0], col + direction[cur_direction][1]
            next
        end

        # puts("cur_row: #{row}, cur_col: #{col}")
        visited << [row, col]

        next_row, next_col = row + direction[cur_direction][0], col + direction[cur_direction][1]
        # puts("next_row: #{next_row}, next_col: #{next_col}")
        break if next_row >= puzzle.length || next_col >= puzzle[next_row].length || next_row < 0 || next_col < 0

        if puzzle[next_row][next_col] == '#'
            if cur_direction == direction.length - 1
                # puts('reseting direction')
                cur_direction = 0
            else
                cur_direction += 1
            end
        end

        row, col = row + direction[cur_direction][0], col + direction[cur_direction][1]
    end

    [visited, endless]
end


ideal_path = puzzle_traverse(puzzle, nil)[0].uniq
puts(ideal_path.inspect)
puts("hello #{ideal_path.length}")


# puzzle[2][1] = '#'
# puzzle_traverse(puzzle, ideal_path)[1]

result = 0
ideal_path.each do |coord_x, coord_y|
    puzzle[coord_x][coord_y] = '#'
    if puzzle_traverse(puzzle, ideal_path)[1]
        puts("coord_x: #{coord_x}, coord_y: #{coord_y}")
        result += 1 
    end
    puzzle[coord_x][coord_y] = '.'
end

print(result)