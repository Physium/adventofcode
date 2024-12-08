input = 'day2.txt'

result = 0
temp = []

def solve(line_arr)
    l, r = 0, 1

    increase = false
    invalid = false

    val1 = line_arr[l].to_i 
    val2 = line_arr[r].to_i

    diff = val1 - val2
    increase = true if diff.negative?

    while r < line_arr.length
        val1 = line_arr[l].to_i 
        val2 = line_arr[r].to_i

        diff = val1 - val2
        puts diff

        if increase
            if diff < -3 || diff.zero? || diff.positive?
                puts('increase invalid')
                invalid = true 
                break
            end
        else
            if diff > 3 || diff.zero? || diff.negative?
                puts('decrease invalid')
                invalid = true 
                break
            end
        end

        l = r
        r += 1
    end

    invalid
end

File.foreach(input) do |line|
    line_arr = line.split(' ')

    if !solve(line_arr)
        puts('before')
        result += 1 
    else
        puts('here')
        for i in 0...line_arr.length
            temp_arr = line_arr.dup
            temp_arr.delete_at(i)
            puts(temp_arr.inspect)
            if !solve(temp_arr)
                result += 1
                break
            end
        end
    end
end
print(result)
