input = 'day6.txt'

puzzle = []
File.foreach(input) do |line|
    clean = line.chomp.split('')
    puzzle << clean
end

puts(puzzle.length)
puts(puzzle[0].length)
puts(puzzle.inspect)

hash_coords = Hash.new
carot_coord = nil

for i in 0...puzzle.length
    for j in 0...puzzle[i].length
        carot_coord = [i,j] if puzzle[i][j] == '^'
        if puzzle[i][j] == '#'
            hash_coords[[i, j]] = 1
        end
    end
end

puts(hash_coords.inspect)

def within_bound(i,j, puzzle)
    # puts("i: #{i}, j: #{j}")
    i < puzzle.length && j < puzzle[i].length && i >= 0 && j >= 0
end

x, y = carot_coord[0], carot_coord[1]

# -1,0 0,1 -1,0, 0,-1

direction = [[-1, 0], [0, 1], [1, 0], [0, -1]]
track = []
cur_direction = 0

while within_bound(x, y, puzzle) do    
    track << [x, y]

    temp_x, temp_y = x + direction[cur_direction][0], y + direction[cur_direction][1]
    if !hash_coords[[temp_x, temp_y]].nil?
        if cur_direction == direction.length - 1
            puts('reseting')
            cur_direction = 0
        else
            puts('turn')
            cur_direction += 1
        end
    end
    puts(cur_direction)
    x, y = x + direction[cur_direction][0], y + direction[cur_direction][1]
end

puts(track.inspect)
puts(track.uniq.length)