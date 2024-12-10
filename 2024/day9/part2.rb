input = 'day9.txt'

diskmap = nil

File.foreach(input) do |line|
    diskmap = line.chomp.split('')
end

puts diskmap.inspect
puts diskmap.length

formatted_disk = []
id = 0
file = true

for i in 0...diskmap.length
    if file
        formatted_disk += Array.new(diskmap[i].to_i, id.to_s)

        id += 1
        file = false
    else
        formatted_disk += Array.new(diskmap[i].to_i, '.')
        file = true
    end
end

puts formatted_disk.inspect
puts("last id: #{id}")

id = id - 1

right_index = formatted_disk.length - 1

# start from the right to find pairs id
while right_index >= 0 do
    if formatted_disk[right_index] == '.'
        right_index -= 1
        next
    end

    if formatted_disk[right_index].to_i == id
        right_search_index = right_index
        right_search_index -= 1 while formatted_disk[right_search_index].to_i == id

        # it ends when at the index that is not matching so have to plus 1
        right_search_index += 1
        sub_id_arr = formatted_disk[right_search_index..right_index]
        # puts(sub_id_arr.inspect)
        cache_right_index = right_index
        right_index = right_search_index
        id -= 1
    end

    # now search from the start to fix empty dot patterns
    # can idk can probably find a way to cache these to optimise it
    left_index = 0

    while left_index < right_index do
        if formatted_disk[left_index] != '.'
            left_index += 1
            next
        end

        left_search_index = left_index
        left_search_index += 1 while formatted_disk[left_search_index] == '.'
        left_search_index -= 1

        sub_dot_arr = formatted_disk[left_index..left_search_index]
        # puts sub_dot_arr.inspect
        # puts formatted_disk[left_index...left_index + sub_id_arr.length].inspect

        if sub_dot_arr.length >= sub_id_arr.length
            temp = formatted_disk[left_index...left_index + sub_id_arr.length]
            formatted_disk[left_index...left_index + sub_id_arr.length] = formatted_disk[right_search_index..cache_right_index]
            formatted_disk[right_search_index..cache_right_index] = temp
            # puts formatted_disk.join('')
            break
        end
        left_index = left_search_index
        left_index += 1
    end
    # puts formatted_disk.join('')
    
    right_index -= 1
end

result = 0
for i in 0...formatted_disk.length
    next if formatted_disk[i] == '.'

    result += i * formatted_disk[i].to_i
end
puts result

# while right_index > 0 do
#     if formatted_disk[right_index] == '.'
#         right_index -= 1
#         next
#     end
#     if formatted_disk[right_index].to_i == id
#         id_range = right_index
#         while formatted_disk[id_range].to_i == id
#             id_range -= 1
#         end
#         # puts("#{id_range}, #{index}")
#         sub_id_arr = formatted_disk[id_range+1..right_index]
#         cache_start = id_range + 1
#         cache_end = right_index
#         # puts(sub_id_arr.inspect)
#         id -= 1
#         right_index = id_range+1
#     end

#     left_index = 0
#     while left_index <= right_index do
#         if formatted_disk[left_index] != '.'
#             left_index += 1
#             next
#         end

#         empty_dot_length = 0
#         while formatted_disk[left_index] == '.'
#             left_index += 1
#             empty_dot_length += 1
#         end

#         # puts(formatted_disk[(left_index-empty_dot_length)...left_index].inspect)
#         if sub_id_arr.length <= empty_dot_length
#             # puts("left: #{left_index-empty_dot_length} end: #{left_index-1}")
#             # puts(formatted_disk[(left_index-empty_dot_length)..left_index-1].inspect)
#             start_point = left_index - empty_dot_length
#             temp = formatted_disk[start_point..start_point + (sub_id_arr.length - 1)]
#             # puts temp.inspect
#             formatted_disk[start_point..start_point + (sub_id_arr.length - 1)] = sub_id_arr

#             formatted_disk[cache_start..cache_end] = temp
#             break
#         end
#     end

#     # puts formatted_disk.join('')
#     right_index -= 1
# end



# # puts queue.inspect
# puts formatted_disk.inspect

# # Define the array
# # Write the array's inspect output to a file
# File.open("logs.txt", "a") do |file|
#   file.puts formatted_disk.inspect
# end
# # puts formatted_disk.join('')

# result = 0
# for i in 0...formatted_disk.length
#     # break if formatted_disk[i] == '.'

#     result += i * formatted_disk[i].to_i
# end
# puts result