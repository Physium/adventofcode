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

regex = /(?:don't|do)\(\)|mul\((\d{1,3}),(\d{1,3})\)/

# puts(text_dump)
matches = text_dump.scan(regex)
puts(matches.length)

regex2 = /(?:do|don't)\(\)/
do_dont = text_dump.scan(regex2)

activate = 'do()'
matches.each do |nums|
    if nums[0].nil?
        activate = do_dont.delete_at(0) 
        next
    end
    next if activate == "don't()"



    result += mul(nums[0].to_i, nums[1].to_i)
end

print(result)