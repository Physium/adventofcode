input = 'sample.txt'

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

# puts formatted_disk.join('')
puts formatted_disk.length

l = 0 
r = formatted_disk.length - 1

while l + 2 < r do
    # puts formatted_disk.join('')
    
    l += 1  while formatted_disk[l] != '.'
    r -= 1  while formatted_disk[r] == '.'
    # puts("l: #{l}, r: #{r}")
    
    temp = formatted_disk[l]
    formatted_disk[l] = formatted_disk[r]
    formatted_disk[r] = temp
    # puts formatted_disk.join('')
end

puts formatted_disk.join('')

result = 0
for i in 0...formatted_disk.length
    break if formatted_disk[i] == '.'

    result += i * formatted_disk[i].to_i
end
puts result