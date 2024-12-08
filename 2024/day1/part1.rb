input = 'day1.txt'

result = []

left_arr = []
right_arr = []
File.foreach(input) do |line|
    line_arr = line.split(' ')
    left_arr << line_arr[0]
    right_arr << line_arr[1]
end

left_arr.sort!
right_arr.sort!

for i in 0...left_arr.length
    puts("index: #{i}: left: #{left_arr[i]}, right: #{right_arr[i]}")
    result << (left_arr[i].to_i - right_arr[i].to_i).abs
end

print(result.sum)
