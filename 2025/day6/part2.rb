input = 'day6.txt'

rows = []

File.foreach(input) do |line|
    rows << line.chomp.split('')
end

m = rows.pop
m.select! { |v| ["*", "+"].include?(v) }

m_idx = 0
result = 0
cur = 0
for col in 0...rows[0].length
    num = ""
    
    multi = m[m_idx]
    for row in 0...rows.length
        num += rows[row][col]
    end

    temp = num.to_i
    puts temp.inspect
    if temp == 0
        puts cur
        puts multi
        m_idx += 1 
        result += cur
        cur = 0
        next
    end

    if multi == "*"
        if cur.zero?
            cur = temp
        else
            cur *= temp
        end
    else
        cur += temp
    end

    result += cur if col == rows[0].length - 1
end

puts result
