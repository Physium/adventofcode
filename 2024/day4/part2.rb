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
# top_left top_right bottom_left bottom_right
top_left = [-1,-1]
top_right = [-1,1]
bottom_left =  [1,-1]
bottom_right = [1,1]

temp = []

for a in 0...puzzle.length
    for b in 0...puzzle[a].length
        puts("finding A AT #{a},#{b}")
        if puzzle[a][b] == 'A'
            puts("FOUNT A AT #{a},#{b}")
            next if a + top_left[0] < 0 || b + top_left[1] < 0 || b + top_right[1] >= puzzle.length
            next if a + bottom_left[0] >= puzzle.length || b + bottom_left[1] < 0 || b + bottom_right[1] >= puzzle.length

            mtop_lefta = a + top_left[0]
            mtop_leftb = b + top_left[1]

            stop_righta = a + top_right[0]
            stop_rightb = b + top_right[1]

            mbottom_lefta = a + bottom_left[0]
            mbottom_leftb = b + bottom_left[1]

            sbottom_righta = a + bottom_right[0]
            sbottom_rightb = b + bottom_right[1]

            coords_array = [[mtop_lefta, mtop_leftb], [stop_righta, stop_rightb], [mbottom_lefta, mbottom_leftb], [sbottom_righta, sbottom_rightb]]

            temp = {
                'M' => 0,
                'S' => 0
            }

            coords_array.each do |coord|
                puts("alpha: #{puzzle[coord[0]][coord[1]]}")
                next if puzzle[coord[0]][coord[1]] != 'M' && puzzle[coord[0]][coord[1]] != 'S'

                temp[puzzle[coord[0]][coord[1]]] += 1
            end

            puts(temp.inspect)
            if temp['M'] == 2 && temp['S'] == 2
                arr1 = [puzzle[mtop_lefta][mtop_leftb], puzzle[sbottom_righta][sbottom_rightb]]
                arr2 = [puzzle[mbottom_lefta][mbottom_leftb], puzzle[stop_righta][stop_rightb]]
                
                puts(arr1.inspect)
                puts(arr2.inspect)
                result += 1 if arr1 == arr2 || arr1.reverse == arr2
            end
            puts("result: #{result}")
        end
    end
end

print(result)

