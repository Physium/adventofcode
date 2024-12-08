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
        if puzzle[a][b] == 'X'
            puts("FOUND X AT #{a},#{b}")
            coords.each do |coord|
                next if a + coord[0] < 0 || b + coord[1] < 0
                next if a + coord[0] >= puzzle.length || b + coord[1] >= puzzle.length
            
                puts("a:#{a + coord[0]} b:#{b + coord[1]}")

                if puzzle[a + coord[0]][b + coord[1]] == 'M'
                    puts("FOUND M AT #{a + coord[0]},#{b + coord[1]}")

                    m_coorda = a + coord[0]
                    m_coordb = b + coord[1]
                    coords.each do |coord|
                        next if m_coorda + coord[0] < 0 || m_coordb + coord[1] < 0
                        next if m_coorda + coord[0] >= puzzle.length || m_coordb + coord[1] >= puzzle.length

                        if puzzle[m_coorda + coord[0]][m_coordb + coord[1]] == 'A'
                            puts("FOUND A AT #{m_coorda + coord[0]},#{m_coordb + coord[1]}")

                            a_coorda = m_coorda + coord[0]
                            a_coordb = m_coordb + coord[1]

                            coords.each do |coord|
                                next if a_coorda + coord[0] < 0 || a_coordb + coord[1] < 0
                                next if a_coorda + coord[0] >= puzzle.length || a_coordb + coord[1] >= puzzle.length

                                if puzzle[a_coorda + coord[0]][a_coordb + coord[1]] == 'S'
                                    result += 1
                                    puts("FOUND S AT #{a_coorda + coord[0]},#{a_coordb + coord[1]}")
                                    break
                                end
                            end
                            break
                        end
                    end
                    break
                end
            end
        end
    end
end

print(result)

