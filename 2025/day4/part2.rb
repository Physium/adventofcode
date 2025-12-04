input = 'day4.txt'

grid = []
File.foreach(input) do |line|
    grid << line.chomp.split('')
end

tp_coords = []

for row in 0...grid.length
    for col in 0...grid[row].length
        tp_coords << [row, col] if grid[row][col] == "@"
    end
end

puts(tp_coords.inspect)

result = 0

# hehe lol just keep looping to find valid @ and kill it manually
while true do
    # cur = result
    tp_coords.each do |row, col|
        next if grid[row][col] == '.'

        area_tp = 0

        dirs = [[0,1], [0,-1], [1,0], [-1, 0], [1,-1], [1,1],[-1,1],[-1,-1]]

        dirs.each do |x, y|
            break if area_tp >= 4
            next_row = row + x
            next_col = col + y

            next if next_row.negative? || next_col.negative?
            next if next_row >= grid.length || next_col >= grid[0].length

            area_tp += 1 if grid[next_row][next_col] == '@'
        end
        
        if area_tp < 4 && 
            result += 1 
            grid[row][col] = '.'
        end

        area_tp = 0
    end
    puts result
end

