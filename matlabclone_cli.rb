require './matlabclone.rb'
include Hassan
test = MatLabclone.new
run = true

while run
  puts 'Welcome to MatLab Clone designed by Hassan Oyeboade'
  puts 'Enter 1 to create an array'
  puts 'Enter 2 to create a matrix'
  puts 'Enter 3 to create a x-by-y vector of zero'
  puts 'Enter 4 to add a matrix and a number'
  puts 'Enter 5 to transpose a matrix'
  puts 'Enter 6 to find the inverse of a matrix'
  puts 'Enter 7 to concatenate matrixes'
  puts 'Enter 8 to save to file'
  puts 'Enter 9 to load from file'
  puts 'Enter 10 to exit'
  input = gets.chomp
  case input

  when '1'
    puts 'Enter array to be created in the following format x y z'
    array = gets.chomp
    test.create_arr(array)
  when '2'
    puts 'Enter matrix to be created in the following format a b c;e f g;h i j'
    matrix = gets.chomp
    test.create_mat(matrix)
  when '3'
    puts 'Enter the value of x: number of rows'
    rows = gets.chomp
    puts 'Enter the value of y: number of columns'
    columns = gets.chomp
    test.zeros(rows, columns)
  when '4'
    puts 'Enter the matrix. Must follow the format a b c;d e f;g h i'
    matrix = gets.chomp
    puts 'Enter the number you want to add to the matrix'
    number = gets.chomp.to_i
    test.add(matrix, number)
  when '5'
    puts 'Enter the matrix to be transposed.'
    matrix = gets.chomp
    test.transpose(matrix)
  when '6'
    puts 'Enter the matrix to be inversed.'
    matrix = gets.chomp
    test.inverse(matrix)
  when '7'
  when '8'
    puts 'Use this command to save: save filename.mat'
    input = gets.chomp
    test.save(input)
  when '9'
    puts 'Use this command to load file: load filename.mat'
    input = gets.chomp
    test.load(input)

  when '10'
    run = false
  else
    puts 'Enter a valid number. Number must be between 1 and 10'
  end
end
