dial = 50
zeros = 0

while line = STDIN.gets
    direction = line[0]
    rotation = line[1..-1].to_i
    zeros += rotation / 100

    if direction == 'L'
        rotation = -rotation
    end

    old_dial = dial
    dial = (dial + rotation) % 100

    if dial == 0
        zeros += 1
    elsif direction == 'R' and old_dial > dial
        zeros += 1
    elsif direction == 'L' and old_dial < dial and old_dial != 0
        zeros += 1
    end
end

puts "Password: #{zeros}" #6684
