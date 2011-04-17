# -*- coding: utf-8 -*-
# Используйте names.txt, текстовый файл размером 46 КБ, содержащий более пяти тысяч имён. 
# Начните с сортировки в алфавитном порядке. Затем подсчитайте алфавитные значения каждого 
# имени и умножьте это значение на порядковый номер имени в отсортированном списке для 
# получения количества очков имени.

# Например, если список отсортирован по алфавиту, имя COLIN 
# (алфавитное значение которого 3 + 15 + 12 + 9 + 14 = 53) является 938-ым в списке. 
# Поэтому, имя COLIN получает 938 × 53 = 49714 очков.

# Какова сумма очков имён в файле?

# Используем тот факт что 'A'.codepoints будет равен 65
sum = 0
IO.read("names.txt").split(',').map{ |w| w[1..-2]}.sort.each_with_index do |word,i|
# Варианты этой строчки с форума красивые и короткие, но чуток более медленные чем мой(:
# eval('[' + IO.read("names.txt") + ']').sort.each_with_index do |word,i|
# IO.read("names.txt").scan(/[A-Z]+/).sort.each_with_index do |word,i| 
  value = 0
  word.codepoints{|c| value += c - 64}
  sum += (i+1) * value
end
puts "Сумма очков имён равна #{sum}"
