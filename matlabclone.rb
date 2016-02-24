# MatLab Clone
require 'matrix'
class MatLabclone
  def create_arr(array)
    if !array.is_a? String
      puts 'Invalid string entered. Please enter a valid string. e.g 2 3 4'
    else
      new_array = ''
      array.split(' ').each do |x|
        new_array << "\t#{x}"
      end
      new_array.strip
      print "a = #{new_array}\nArray created \n"
    end
  end

  def create_mat(matrix)
    if !matrix.is_a? String
      puts 'Invalid string entered. Please enter a valid string'
    else
      puts 'a = '
      matrix.split(';').each do |x|
        puts x.to_s
      end
    end
  end

  def zeros(x, y)
    if x == '0' || y == '0'
      puts 'Invalid number. Number of rows columns cannot be 0 '
    else
      puts 'z = '
      zeromat = ''
      y.to_i.times do
        zeromat << "\t0"
      end
      x.to_i.times do
        puts "     #{zeromat.strip}"
      end
    end
  end

  def add(matrix, number)
    puts "a = \n"
    matrix.split(';').each do |x|
      newmat = ''
      x.split(' ').each do |y|
        newmat << (y.to_i + number).to_s + ' '
        newmat.strip
      end
      puts "      #\t{newmat}"
    end
  end

  def transpose(matrix)
    puts "transpose(a) = \n"
    lastindex = matrix.split(';').length - 1
    for x in 0..lastindex
      newmat = ''
      for i in 0..lastindex
        newmat << matrix.split(';')[i].split(' ')[x] + ' '
        i += 1
      end
      puts "                #{newmat}"
      x += 1
    end
  end

  def inverse(matrix)
    
  mat = Matrix[[1,0,2,3],[2,1,0,3],[3,2,1,0],[4,3,2,1]]
  puts mat.inverse
  end
  def concat(mata,matb)
  end
  def save(input)
  aFile = File.new(input, "w")
   content = aFile.syswrite()
   puts "Saved"
  end
  def load(input)
  aFile = File.new(input, "r")
  if aFile
  content = aFile.readlines
   puts content
  else
    puts "File not found"
  end
  end

end

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
    test.create([[1,2,4,5,7],[2,1,5,3,8],[4,9,1,2,9],[4,2,4,5,4],[1,0,9,3,5]])
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
