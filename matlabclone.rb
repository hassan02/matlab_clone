module Hassan
  require 'colorize'
  require './validity'
  require 'Date'
  # MatLab Clone
  class MatLabclone < Valid
    @@saved = ''
    @@dot = '...........................................................................'
    def create_arr(array)
      @new_array = ''
      if check_array(array) == false
        raise 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
      else
        array.split(' ').each do |x|
          @new_array << "\t#{x}"
        end
        @@saved << "Array created. #{Time.new.inspect}\n a = #{@new_array}\n#{@@dot}\n".yellow
        print "a = #{@new_array}\nArray created\n".yellow
      end
    end

    def create_mat(matrix)
      @newmatrix = ''
      # if check_mat_correct(matrix) == true && check_mat_length(matrix) == true
      matrix.split(';').each do |x|
        @newmatrix << "\t#{x}\n"
      end
      @@saved << "Matrix created. #{Time.new.inspect} \na = #{@newmatrix}\n#{@@dot}\n".yellow
      puts "a = \n#{@newmatrix}".yellow
      # else
      # puts 'Invalid string entered. Please enter a valid string'.red
      # end
    end

    def zeros(x, y)
      @zeromat = ''
      @finalmat = ''
      if x == '0' || y == '0'
        puts 'Invalid. Number of rows or columns cannot be zero'.red
      elsif check_digit(x) == false || check_digit(y) == false
        puts 'Invalid number. Number of rows/columns invalid '.red
      else
        y.to_i.times { @zeromat << "\t0" }
        x.to_i.times { @finalmat << "#{@zeromat}\n" }
        puts "z = \n#{@finalmat}".yellow
        @@saved << "Zero vector matrix created. #{Time.new.inspect}\n z = #{@finalmat}\n#{@@dot}\n".yellow

      end
    end

    def add(matrix, number)
      @nummat = ''
      if check_digit(number) == true
        puts "a + #{number} = \n".yellow
        matrix.split(';').each do |x|
          newmat = ''
          x.split(' ').each do |y|
            newmat << (y.to_i + number.to_i).to_s + "\t"
            newmat.strip
          end
          puts "\t#{newmat}".yellow
          @nummat << "#{newmat}\n"
        end
        @@saved << "Matrix added to number. #{Time.new.inspect}\n a + #{number} =\n       #{@nummat}\n#{@@dot}\n".yellow
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
          newmat = newmat + "\t" + matrix.split(';')[j].split(' ')[i]
        end
        puts "\t#{newmat}".yellow
      end
    end
    def inverse(mat)
      puts 'inverse(a) = '.yellow
      if mat.split(';').length > 3
        puts 'System can only compute for a 2 * 2 or 3 * 3 matrix'.red
      elsif mat.split(';').length == 2
        puts inv2_2(mat).to_s.yellow
      elsif mat.split(';').length == 3
        inv3_3(mat)
      end
    end

    def concat(mata, matb, operator)
      if operator == ','
        puts "[[#{mata}],[#{matb}]= ".yellow
        hor_concat(mata, matb, operator)
      elsif operator == ';'
        puts "[[#{mata}];[#{matb}]= ".yellow
        ver_concat(mata, matb, operator)
      else
        puts 'You have enetered an invalid matrix or type of concatenation'.red
      end
    end

    def save(input)
      if /^save (\w+).mat$/ =~ input
        if File.exist?(input.gsub!('save ', ''))
          File.open(input, 'a') do |file|
            file.puts @@saved
          end
        else
          newfile = File.new(input, 'w')
          newfile.syswrite(@@saved)
          puts 'Saved'.yellow
        end
      else
        puts 'Please save using this command: save filename.mat'.red
      end
    end

    def load(input)
      # /^\d+(\s\d+)*$/
      if /^load (\w+).mat$/ =~ input
        if File.exist?(input.gsub!('load ', ''))
          newfile = File.new(input, 'r')
          content = newfile.read
          puts content.to_s.yellow
        else
          puts 'File does not exist'.red
        end
      else
        puts 'Please load using this command: load filename.mat'.red
      end
    end
     #       afile = File.new(input, 'r')
     #       if afile
     #         content = afile.readlines
     #         puts content
     #       else
     #         puts 'File not found'
     #       end
     #     end
   end
 end
