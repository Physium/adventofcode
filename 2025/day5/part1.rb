input = 'day5.txt'

ranges = []
range = true
inputs = []
File.foreach(input) do |line|
    cur_line = line.chomp
    range = false if cur_line == ""
    if range
        cur_line_arr = cur_line.split('-')
        start = cur_line_arr[0].to_i
        finish = cur_line_arr[1].to_i
        ranges << [start, finish]
    else
        inputs << cur_line.to_i
    end
end

result = 0
inputs.each do |input|
    ranges.each do |range|
        if input >= range[0] && input <= range[1]
            result += 1
            break
        end
    end
end

puts result