input = 'day2.txt'

result = []

File.foreach(input) do |line|
    line_arr = line.split(': ')
    game_id = line_arr[0][4...].to_i
    puts(game_id)
    games = line_arr[1].split(';')

    checker = true
    games.each do |game|
        break unless checker
    
        counter = {
            "red" => 12,
            "green" => 13,
            "blue" => 14
        }
        colors = game.split(',')
        colors.each do |color|
            color_count = color.split(' ')
            counter[color_count[1]] -= color_count[0].to_i
        end

        counter.values.each do |value|
            if value < 0
                checker = false
                break
            end
        end
    end

    result << game_id if checker
end

print(result.sum)

# print(result.sum)
