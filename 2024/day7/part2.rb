input = 'day7.txt'

sum_values = Hash.new

File.foreach(input) do |line|
    clean = line.chomp.split(': ')
    sum_values[clean[0]] = clean[1].split(' ').map(&:to_i)
end

puts(sum_values.inspect)

result = []

sum_values.each do |key, value|
    sum = key.to_i
    index = 1
    queue = [value[0]]
    puts("checking #{sum}")
    while index < value.length do
        temp_queue = []
        while !queue.empty? do
            # puts(queue.inspect)
            # puts(value)
            cur_val = queue.pop

            cur_val_plus = cur_val + value[index] 
            cur_val_multiply = cur_val * value[index]
            cul_val_concat = (cur_val.to_s + value[index].to_s).to_i
            temp_queue << cur_val_plus
            temp_queue << cur_val_multiply
            temp_queue << cul_val_concat
        end
        queue = temp_queue
        index += 1
    end

    result << sum if queue.include?(sum)
end

puts(result.inspect)
puts(result.sum)
