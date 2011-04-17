# -*- coding: utf-8 -*-
# Каково наибольшее произведение четырёх подряд идущих чисел в таблице 20×20 ,
# расположенных в любом направлении (вверх, вниз, вправо, влево или по диагонали)? 

matrix = Array.new # Исходная таблица

# Инициализация таблицы
IO.foreach ("euler0011.txt") do |line|
  matrix << line.split().map{ |elem| elem.to_i } 
end
width = matrix[0].size
height = matrix.size

LEN = 4 # Длина цепочки
products = Array.new # Массив произведений звений цепочек

for i in 0..(width-1)
  for j in 0..(height-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i][j+k]}
    products << product
  end
end
for i in 0..(width-LEN)
  for j in 0..(height-1)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i+k][j]}
    products << product
  end
end
for i in 0..(width-LEN)
  for j in 0..(height-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i+k][j+k]}
    products << product
  end
end
for i in (LEN-1)..(width-1)
  for j in 0..(height-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i-k][j+k]}
    products << product
  end
end
puts "Максимальное произведение: #{products.max}"
