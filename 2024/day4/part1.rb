input = 'day4.txt'

puzzle = []
File.foreach(input) do |line|
    clean = line.split('')
    clean.pop
    puzzle << clean
end

checker = ['M', 'A', 'S']
xmas = []
result = 0

puts(puzzle.inspect)
# right left up down up_right up_left down_right down_left
coords = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [1,-1], [-1, 1], [-1, -1]]
temp = []

for a in 0...puzzle.length
    for b in 0...puzzle[a].length
        puts("finding X AT #{a},#{b}")
        if puzzle[a][b] == 'X'
            puts("FOUND X AT #{a},#{b}")
            coords.each do |coord|
                next if a + coord[0] < 0 || b + coord[1] < 0
                next if a + coord[0] >= puzzle.length || b + coord[1] >= puzzle.length
            
                puts("finding m at a:#{a + coord[0]} b:#{b + coord[1]}")

                if puzzle[a + coord[0]][b + coord[1]] == 'M'
                    mcoorda = a + coord[0]
                    mcoordb = b + coord[1]

                    puts("FOUND M AT #{mcoorda},#{mcoordb}")
                    acoorda = mcoorda + coord[0]
                    acoordb = mcoordb + coord[1]

                    scoorda = acoorda + coord[0]
                    scoordb = acoordb + coord[1]

                    puts("finding a at #{acoorda},#{acoordb}")
                    puts("finding s at #{scoorda},#{scoordb}")
                    # print("#{puzzle[acoorda][acoordb]}, #{puzzle[scoorda][scoordb]}")

                    next if scoorda < 0 || scoordb < 0
                    next if scoorda >= puzzle.length || scoordb >= puzzle.length

                    if puzzle[acoorda][acoordb] == 'A' && puzzle[scoorda][scoordb] == 'S'
                        puts("FOUND A AT #{acoorda},#{acoordb}")
                        puts("FOUND S AT #{scoorda},#{scoordb}")
                        result += 1
                    end
                end
            end
            puts("result: #{result}")
        end
    end
end

print(result)

