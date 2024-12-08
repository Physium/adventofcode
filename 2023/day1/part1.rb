input = 'day1.txt'

result = []

File.foreach(input) do |line|   
    num = ''
    line.split('').each do |letter|
        num += letter if ('0'..'9').include?(letter)
    end
    result << (num[0] + num[-1]).to_i
end

print(result.sum)
