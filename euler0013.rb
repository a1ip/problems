# -*- coding: utf-8 -*-
# Найдите первые десять цифр суммы следующих ста 50-значных чисел.
# Числа хранятся в файле euler0013.txt
sum = 0
IO.foreach ("euler0013.txt") do |line|
  sum += line.to_i
end
puts sum.to_s[0,10]
