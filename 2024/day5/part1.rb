input = 'day5_1.txt'
input2 = 'day5_2.txt'

order = Hash.new { |h, key| h[key] = [] }

File.foreach(input) do |line|
    line_arr = line.chomp.split('|')
    order[line_arr[0]] << line_arr[1]
end

pages = []
File.foreach(input2) do |line|
    line_arr = line.chomp.split(',')
    pages << line_arr
end

# puts(order.inspect)
# puts(pages.inspect)

valid_pages = []
result = 0

pages.each do |page|
    valid = true
    for i in 0...page.length
        break if !valid
        for j in (i + 1)...page.length
            break if !valid

            i_order = order[page[i]]
            if !i_order.include?(page[j])
                valid = false
            end
        end
    end
    valid_pages << page if valid
end

puts (valid_pages.inspect)

valid_pages.each do |page|
    middle_index = page.length/2

    result += page[middle_index].to_i
end

puts result

