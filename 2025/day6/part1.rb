input = 'day6.txt'

rows = []

File.foreach(input) do |line|
    rows << line.split(' ')
end

m = rows.pop
puts(rows.inspect)
puts(m.inspect)

result = 0
for i in 0...m.length
    cur = 0
    for k in 0...rows.length
        puts(rows[k][i].inspect)
        if m[i] == "*"
            if cur.zero?
                cur = rows[k][i].to_i 
            else
                cur *= rows[k][i].to_i 
            end
        end
        cur += rows[k][i].to_i if m[i] == "+"
    end
    result += cur
end

puts result
