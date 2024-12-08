input = 'day1.txt'

result = []

left_arr = []
right_arr = []
File.foreach(input) do |line|
    line_arr = line.split(' ')
    left_arr << line_arr[0]
    right_arr << line_arr[1]
end


counter = Hash.new(0)

right_arr.each do |num|
    counter[num] += 1
end

left_arr.each do |num|
    result << num.to_i * counter[num]
end

print(result.sum)
