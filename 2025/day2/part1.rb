input = 'day2.txt'

result = []

dir = []
ranges = []
File.foreach(input) do |line|
    ranges = line.chomp.split(',')
end

puts ranges.inspect

counter = 0

ranges.each do |range|
    range_arr = range.split('-')
    start = range_arr[0].to_i
    finish = range_arr[1].to_i

    for i in start..finish
        num_str = i.to_s
        next if num_str.length.odd?

        mid = num_str.length/2
        counter += i if num_str[0...mid] == num_str[mid..]
    end
end

puts counter