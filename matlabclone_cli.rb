require './matlabclone'
require 'colorize'
include Hassan
test = MatLabclone.new

puts '...........................................................'.blue
puts '|  Welcome to MatLab Clone developed by Hassan Oyeboade   |'.blue
puts '|       Andela Fellow Class XIII Bootcamp Project         |'.blue
puts '|           Done between 15/02/2016-26/02/2015            |'.blue
puts '|.........................................................|'.blue
run = true

while run
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
    print 'a = '
    array = gets.chomp
    test.create_arr(array)
  when '2'
    puts 'Enter matrix to be created in the following format a b c;e f g;h i j'
    print 'a = '
    matrix = gets.chomp
    test.create_mat(matrix)
  when '3'
    puts 'Enter the value of x: number of rows'
    print 'rows = '
    rows = gets.chomp
    puts 'Enter the value of y: number of columns'
    print 'columns = '
    columns = gets.chomp
    test.zeros(rows, columns)
  when '4'
    puts 'Enter the matrix. Must follow the format a b c;d e f;g h i'
    print 'a = '
    matrix = gets.chomp
    puts 'Enter the number you want to add to the matrix'
    print 'number = '
    number = gets.chomp
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
    print "Enter first matrix to be concatenated.\nmatrix a = "
    mata = gets.chomp
    print "Enter second matrix to be concatenated. \nmatrix b = "
    matb = gets.chomp
    puts 'Please supply the type of concatenation(, or ;). , is for horizontal '
    print "concatenation and ; is for vertical concatenation.\noperation = "
    operator = gets.chomp
    test.concat(mata, matb, operator)
  when '8'
    puts 'Use this command to save: save filename.mat'
    input = gets.chomp
    test.save(input)
  when '9'
    puts 'Use this command to load file: load filename.mat'
    input = gets.chomp
    test.load(input)

  when '10'
    puts 'Thank you for making use of MatLabclone. See you next time'.green
    run = false
  else
    puts 'Enter a valid number. Number must be between 1 and 10'.red
  end
end
