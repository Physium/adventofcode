input = 'day1.txt'

result = []

dir = []
count = []
File.foreach(input) do |line|
    dir << line[0]
    count << line.chomp[1..].to_i
end

cur = 50
result = 0

for i in 0...dir.length
    prev_cur = cur
    if dir[i] == "L"
        cur = (cur - count[i]) % 100
        
        if cur > prev_cur && (!prev_cur.zero? && !cur.zero?)
            result += 1
        end
    else
        cur = (cur + count[i]) % 100
        if cur < prev_cur && (!prev_cur.zero? && !cur.zero?)
            result += 1 
        end
    end

    if count[i] > 99 
        result += count[i]/100
    end
    result += 1 if cur.zero?
    puts cur
end

puts(result)