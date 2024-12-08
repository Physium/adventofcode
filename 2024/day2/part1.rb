input = 'day2.txt'

result = 0
temp = []

File.foreach(input) do |line|
    line_arr = line.split(' ')
    cur = line_arr[0].to_i
    valid = true
    increasing = (cur - line_arr[1].to_i).negative?
    puts(line_arr.inspect)
    for i in 1...line_arr.length
        puts((cur - line_arr[i].to_i))
        if increasing
            puts('here')
            if ((cur - line_arr[i].to_i) > 0 || (cur - line_arr[i].to_i) < -3 ) || cur == line_arr[i].to_i
                puts('invalid')
                valid = false
                break
            end
        elsif !increasing
            if (cur - line_arr[i].to_i) < 1 || (cur - line_arr[i].to_i) > 3 || cur == line_arr[i].to_i
                puts('invalid')
                valid = false
                break
            end
        end
        cur = line_arr[i].to_i
    end
    result += 1  if valid
end

print(result)