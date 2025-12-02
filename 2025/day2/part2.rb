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
        divisor = []
        for j in 1..(num_str.length/2)
            divisor << j if (num_str.length%j).zero?
        end
        
        divisor.each do |d|
            cur = d
            prev = num_str[0...d]
            valid_num = false
            while cur < num_str.length
                if num_str[cur...cur + d] != prev
                    valid_num = false
                    break
                end 
                valid_num = true
                cur += d
            end
            if valid_num
                counter += i
                break
            end
        end
        
    end
end

puts counter

# ugly ass solution LOL
# brute force each number by checking what they are divisible and basically just check if the patterns exists