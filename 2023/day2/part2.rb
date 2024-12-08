input = 'day2.txt'

result = []

File.foreach(input) do |line|
    line_arr = line.split(': ')
    game_id = line_arr[0][4...].to_i
    puts(game_id)
    games = line_arr[1].split(';')

    checker = true
    #super high number
    counter = {
            "red" => 0,
            "green" => 0,
            "blue" => 0
        }
    games.each do |game|
        break unless checker

        colors = game.split(',')
        colors.each do |color|
            color_count = color.split(' ')
            counter[color_count[1]] = color_count[0].to_i if color_count[0].to_i > counter[color_count[1]]
        end
    end
    puts(counter)
    result << counter.values.inject(1) { |acc, value| acc * value }
end

print(result.sum)

# print(result.sum)
