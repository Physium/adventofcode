input = 'day3.txt'

result = 0
temp = []

def mul(num1, num2)
    num1 * num2
end

text_dump = ""
File.foreach(input) do |line|
    text_dump += line
end

regex = /mul\((\d{1,3}),(\d{1,3})\)/

# puts(text_dump)
matches = text_dump.scan(regex)

puts(matches.length)
matches.each do |nums|
    # puts(mul(nums[0].to_i, nums[1].to_i))
    puts(nums.inspect)
    result += mul(nums[0].to_i, nums[1].to_i)
end

print(result)