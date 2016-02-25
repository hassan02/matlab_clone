module Hassan
  require 'colorize'
  require 'matrix'
  # MatLab Clone
  class MatLabclone
    def create_arr(array)
      if check_array(array) == false
        puts 'Invalid string entered. Please enter a valid string. e.g 2 3 4'
      else
        new_array = ''
        array.split(' ').each do |x|
          new_array << "#{x}\t"
        end
        @newarray = new_array.strip.yellow
        print "a = #{@newarray}\nArray created\n"
      end
    end

    def create_mat(matrix)
      @newmatrix = ''
      if check_mat_correct(matrix) == true && check_mat_length(matrix) == true  
        puts 'a = '
        matrix.split(';').each do |x|
          @newmatrix << "#{x}\n"
        end
        puts @newmatrix
        else
        puts 'Invalid string entered. Please enter a valid string'
      end
    end

    def zeros(x, y)
      if x == '0' || y == '0'
        puts 'Invalid number. Number of rows columns cannot be 0 '.red
      else
        puts 'z = '
        zeromat = ''
        y.to_i.times do
          zeromat << "0\t"
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
        puts "      #{newmat}\t"
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

    def inverse(mat)
      if mat.split(';').length > 3
        puts 'System can only compute for a 2 * 2 or 3 * 3 matrix'
      elsif mat.split(';').length == 2
        inv2_2(mat)
      elsif mat.split(';').length == 3
        inv3_3(mat)
      end
    end

    def concat(mata, matb)
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

    def inv2_2(mat)
    end

    def inv3_3(mat)
    end
    def check_array(array)
      if /^\d+(\s\d+)*$/.match(array)
       stat = true
      else
       stat = false
      end
    end
    def check_mat_correct(matrix)
      stat = true
      matrix.split(";").each do |x|
      if /^\d+(\s\d+)*$/.match(x)
       stat = true
       else
       stat = false
       break
       end
       return stat
    end
    end
     def check_mat_length(matrix)
      stat = true
      newx = matrix.split(";")[0].split(" ").length
      matrix.split(";").each do |x|
      if x.split(" ").length == newx
        stat = true
      else
        stat = false
      break
      end
      end
     return stat 
    end
    def check_digit(num)
      if /^\d+/.match(num)
        returns true
      else
        return false
      end
    end
end
end
