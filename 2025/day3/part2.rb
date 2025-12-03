input = 'sample.txt'

ratings = []
File.foreach(input) do |line|
    ratings << line.chomp
end

$highest = 0
$memo = {}
result = 0
puts ratings.inspect

def backtrack(cur, need, rating)
    # cache cur index and the remainder amount needed to form the digits
    key = [cur, need]

    return $memo[key] if $memo.key?(key)

    if need == 0
        $memo[key] = 0
        return 0
    end

    if cur == rating.length || (rating.length - cur) < need
        $memo[key] = -Float::INFINITY
        return $memo[key]
    end

    # idea is at this current index
    # what would be the highest 
    # eg 8192 at cur 0
    # take would be 89
    # skip would be 92
    take = rating[cur].to_i * (10 ** (need - 1)) + backtrack(cur + 1, need - 1, rating)
    skip = backtrack(cur + 1, need, rating)

    best = [take, skip].max
    $memo[key] = best
    best
end

ratings.each do |rating|
   
   $highest += backtrack(0, 12 , rating)
   $memo = {}
end

puts $highest

# use AI to help come up with this DP top down approach. brutal.