# https://github.com/careyi3/aoc_2024/blob/master/solutions/12/second.rb

input = 'sample.txt'

$puzzle = []

File.foreach(input) do |line|
    clean = line.chomp.split('')
    $puzzle << clean
end

puts $puzzle.inspect

$map = Hash.new

for row in 0...$puzzle.length
    for col in 0...$puzzle[row].length
        $map[[row, col]] = false
    end
end

# tracking is an array of values
# e.g. [0, 0, []]
# it consist of the area, perimeter, and an array of coords ->
# with directional index to identify a perimeter which is used in part2
# region A would be [4, 10 , [[[0,3], 0],[[0,4], 0] ] etc
def dfs(coords, tracking)
    type = $puzzle[coords[0]][coords[1]]
    puts("searching at #{coords.inspect} with type: #{type}")
    $map[coords] = true
    tracking[0] += 1

    # right left down up
    search_area = [[0,1], [0,-1], [1,0], [-1,0]]
    search_area.each_with_index do |dir, index|
        next_coords = [coords[0] + dir[0], coords[1] + dir[1]]
        
        # check if next cell is out of bound or != to the same region
        # if true they are considered a side/perimeter :)
        if $map[next_coords].nil? || $puzzle[next_coords[0]][next_coords[1]] != type
            tracking[1] += 1
            tracking[2] << [coords, index]
            next
        end
        # skip if visited
        next if $map[next_coords]

        tracking = dfs(next_coords, tracking)
    end

    tracking
end


regions = {}
region_id = 0

$map.each do |m_key, m_value|
    next if m_value

    regions[[region_id, $puzzle[m_key[0]][m_key[1]]]] = dfs(m_key, [0, 0, []])
    region_id += 1
end

puts regions.inspect

# count side is interesting
# we take params, group them by the direction
# > A A <
# > A <
# we sort them by col coords
# and look for consective row 
# e.g. 1,3 2,3 ,3,3 << this is one side
# e.g. 2,4 < this is another side on its own
def count_side(sides)
    puts("starting count sides")
    side_count = 0
    # group coords by the col
    # side = e.g. [[0,1] 0]
    sides.group_by { |side| side[0][1] }.each do |_, coords|
        last_value = nil
        # sort coords by row
        # check if the sorted row deviates from consective e.g 1,2,3,5
        coords.sort_by { |side| side[0][0] }.each do |sorted|
            if last_value.nil?
                last_value = sorted[0][0]
                side_count += 1
                next
            end

            if sorted[0][0] - 1 == last_value
                last_value = sorted[0][0]
                next
            end

            last_value = sorted[0][0]
            side_count += 1
        end
        puts("side_count: #{side_count}")
    end
    side_count
end

result = 0
puts regions.inspect
regions.each do |key, value|
    puts("processing region #{key}, #{value}")
    group_sides_by_dir = value[2].group_by { |side| side[1] }
    side_count = 0
    # i only need to care about l/r or u/d
    # the sides are equal on both side so finding 1 means i just need to multiply
    for dir in 0...2
        side_count += count_side(group_sides_by_dir[dir]) * 2
    end

    result += value[0] * side_count
    puts("#{key}, #{side_count}")
end

puts result

# so what i need to tweak my dfs 
# find a better way to find regions instead of just blasting every cell
# store regions after travesing
# each region should tell me the area and perimeter points and type
# while travsing to find regions i should be able to track permeter points 
# these permeter poitns should then be able to tell me how to get the sides by sorting them according to x or y