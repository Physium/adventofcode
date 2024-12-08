input = 'day3.txt'

result = 0
temp = []

def mul(num1, num2)
    num1 * num2
end

def is_digit?(s)
    code = s.ord
    # 48 is ASCII code of 0
    # 57 is ASCII code of 9
    48 <= code && code <= 57
  end

def is_valid_digits(num)
    num.split('').each do |n|
        return false if !is_digit?(n)
    end

    true
end
text_dump = ""
File.foreach(input) do |line|
    text_dump += line
end

max_input = '000,000)'.length

index = 0
while index < text_dump.length do
    if text_dump[index...(index+4)] != 'mul('
        index += 1
        next
    end

    start_index = index+4
    end_index = start_index
    while end_index < start_index + max_input && text_dump[end_index] != ')' do
        end_index += 1
    end

    if text_dump[end_index] == ')'
        temp_text = text_dump[start_index...end_index]
        num_arr = temp_text.split(',')
        

        if num_arr.length == 2
            puts(num_arr.inspect)
            if is_valid_digits(num_arr[0]) && is_valid_digits(num_arr[1])
                puts("#{num_arr[0]} & #{num_arr[1]}")
                result += mul(num_arr[0].to_i, num_arr[1].to_i)
                index = end_index +1
                next
            end
        end
    end
    
    index += 1
end



print(result)
