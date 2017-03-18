def luhn(card)
  sum = 0
  numbers = []

  while card > 0
    numbers << card % 10
    card /= 10
  end

  check = numbers.shift
  doubled = []

  numbers.each_with_index do |doubler, i|
    if i.odd?
      doubled << doubler
    else
      doubler *= 2
      if doubler >= 10
        doubled << doubler -= 9
      else
        doubled << doubler
      end
    end
  end

  doubled.each do |math|
    sum += math
  end

  if (10 - (sum % 10)) == check || sum % 10 == 0
    puts "Valid card!"
  else
    puts "Invalid card!"
  end

end

puts "What card do you want to check"
input = gets.chomp
input = input.to_i
puts luhn(input)
