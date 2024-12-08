input = 'day1.txt'

count_to_num = {
  3 => ['one', 'two', 'six'],
  4 => ['four', 'five', 'nine'],
  5 => ['three', 'seven', 'eight']
}

num_to_int = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}

result = []

File.foreach(input) do |line|
    num = ''
    index = 0

    while index < line.length - 1
        puts(index)
        if ('0'..'9').include?(line[index])
            num += line[index] 
        else
            if index + 2 < line.length
                # print(count_to_num[3])
                # print(line[index..index+2])
                if count_to_num[3].include?(line[index..index+2])
                    num += num_to_int[line[index..index+2]].to_s
                    index += 2
                    next
                end
            end

            if index + 3 < line.length
                # print(count_to_num[4])
                # print(line[index..index+3])
                if count_to_num[4].include?(line[index..index+3])
                    num += num_to_int[line[index..index+3]].to_s
                    index += 3
                    next
                end
            end

            if index + 4 < line.length
                if count_to_num[5].include?(line[index..index+4])
                    num += num_to_int[line[index..index+4]].to_s
                    index += 4
                    next
                end
            end
        end
        index += 1
    end
    puts(num)
    result << (num[0] + num[-1]).to_i
end
puts(result.sum)