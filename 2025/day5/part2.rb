input = 'day5.txt'

ranges = []
range = true
inputs = []
File.foreach(input) do |line|
    cur_line = line.chomp
    break if cur_line == ""
    if range
        cur_line_arr = cur_line.split('-')
        start = cur_line_arr[0].to_i
        finish = cur_line_arr[1].to_i
        ranges << [start, finish]
    else
        inputs << cur_line.to_i
    end
end
ranges.sort!
puts(ranges.inspect)


new_ranges = [ranges[0]]

for i in 1...ranges.length
    if new_ranges.last[1] >= ranges[i][0]
        new_ranges.last[1] = [ranges[i][1], new_ranges.last[1]].max
    else
        new_ranges << ranges[i]
    end
end

puts (new_ranges.inspect)
result = 0
new_ranges.each do |nr|
    result += (nr[1] - nr[0]) + 1
end
puts result

#LC56 LOL!
