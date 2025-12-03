input = 'day3.txt'

ratings = []
File.foreach(input) do |line|
    ratings << line.chomp
end

puts(ratings)

result = 0

ratings.each do |rating|
    left = 0
    right = 1
    highest_right = 0

    while right < rating.length
        if rating[right].to_i > rating[left].to_i && right != rating.length - 1
            left = right
            highest_right = rating[right + 1].to_i
        else
            if rating[right].to_i > highest_right 
                # puts rating[right]
                highest_right = rating[right].to_i 
            end
        end
        right += 1
    end
    puts("#{rating[left]} : #{highest_right}")
    result += "#{rating[left]}#{highest_right}".to_i
end


puts result