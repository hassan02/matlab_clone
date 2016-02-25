module Hassan
  require 'colorize'
  require './validity'
  require 'matrix'
  # MatLab Clone
  class MatLabclone < Valid
    def create_arr(array)
      if check_array(array) == false
        puts 'Invalid string entered. Please enter a valid string. e.g 2 3 4'
      else
        new_array = ''
        array.split(' ').each do |x|
          new_array << "#{x}\t"
        end
        @newarray = new_array.strip.yellow
        print "a = #{@newarray}\nArray created\n".yellow
      end
    end

    def create_mat(matrix)
      @newmatrix = ''
      if check_mat_correct(matrix) == true && check_mat_length(matrix) == true
        puts 'a = '.yellow
        matrix.split(';').each do |x|
          @newmatrix << "#{x}\n"
        end
        puts @newmatrix.yellow
      else
        puts 'Invalid string entered. Please enter a valid string'
      end
    end

    def zeros(x, y)
      if check_digit(x) == false || check_digit(y) == false
        puts 'Invalid number. Number of rows/columns invalid '.red
      else
        puts 'z = '.yellow
        zeromat = ''
        y.to_i.times do
          zeromat << "0\t"
        end
        x.to_i.times do
          puts "     #{zeromat.strip}".yellow
        end
      end
    end

    def add(matrix, number)
      if check_digit(number) == true
        puts "a + #{number} = \n"
        matrix.split(';').each do |x|
          newmat = ''
          x.split(' ').each do |y|
            newmat << (y.to_i + number.to_i).to_s + ' '
            newmat.strip
          end
          puts "      #{newmat}\t".yellow
        end

      else
        puts 'Invalid matrix or number. Please try again'.red
      end
   end

    def transpose(matrix)
      puts 'transpose(a) = '.yellow
      rows = matrix.split(';').length
      columns = matrix.split(';')[0].split(' ').length
      newmat = ''
      for i in 0..columns - 1
        newmat = ''
        for j in 0..rows - 1
          newmat = newmat + ' ' + matrix.split(';')[j].split(' ')[i]
        end
        puts "\t         #{newmat}".yellow
      end
      end

    def inverse(mat)
      if mat.split(';').length > 3
        puts 'System can only compute for a 2 * 2 or 3 * 3 matrix'.red
      elsif mat.split(';').length == 2
        inv2_2(mat)
      elsif mat.split(';').length == 3
        inv3_3(mat)
      end
    end

    def concat(mata, matb, operator)
      if operator == ','
        hor_concat(mata, matb, operator)
      elsif operator == ';'
        ver_concat(mata, matb, operator)
      else
        puts 'You have enetered an invalid matrix or type of concatenation'
      end
    end

    def save(input)
      afile = File.new(input, 'w')
      unless @newarr == ''
        content = afile.syswrite(@newmatrix)
        puts 'Saved'
      end
    end

    def load(input)
      afile = File.new(input, 'r')
      if afile
        content = afile.readlines
        puts content
      else
        puts 'File not found'
      end
    end
   end
 end
