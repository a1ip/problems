# -*- coding: utf-8 -*-
# Каково наибольшее произведение четырёх подряд идущих чисел в таблице 20×20 ,
# расположенных в любом направлении (вверх, вниз, вправо, влево или по диагонали)? 

matrix = Array.new # Исходная таблица

# Инициализация таблицы
rows = 0
columns = 0
IO.foreach ("euler0011.txt") do |line|
  rows += 1
  row = line.split().map{ |elem| elem.to_i } 
  columns = row.length
  matrix << row
end

LEN = 4 # Длина цепочки
products = Array.new # Массив произведений звений цепочек

for i in 0..(rows-1)
  for j in 0..(columns-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i][j+k]}
    products << product
  end
end
for i in 0..(rows-LEN)
  for j in 0..(columns-1)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i+k][j]}
    products << product
  end
end
for i in 0..(rows-LEN)
  for j in 0..(columns-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i+k][j+k]}
    products << product
  end
end
for i in (LEN-1)..(rows-1)
  for j in 0..(columns-LEN)
    product = matrix[i][j]
    1.upto(LEN-1) {|k| product *= matrix[i-k][j+k]}
    products << product
  end
end
puts products.max
