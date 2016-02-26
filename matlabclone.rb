module Hassan
  require 'colorize'
  require './validity'
  require 'Date'
  # MatLab Clone
  class MatLabclone < Valid
    @@saved = ''
    @@dot = '...........................................................................'
    def initialize
    end

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
      matrix.split(';').each do |x|
        @newmatrix << "\t#{x}\n"
      end
      @@saved << "Matrix created. #{Time.new.inspect} \na = #{@newmatrix}\n#{@@dot}\n".yellow
      puts "a = \n#{@newmatrix}".yellow
    end

    def zeros(x, y)
      @zeromat = ''
      @finalmat = ''
      if x == '0' || y == '0'
        raise 'Invalid. Number of rows or columns cannot be zero'.red
      elsif check_digit(x) == false || check_digit(y) == false
        raise 'Invalid number. Number of rows/columns invalid '.red
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
        raise 'Invalid matrix or number. Please try again'.red
      end
   end

    def transpose(matrix)
      @trans = ''
      puts 'transpose(a) = '.yellow
      rows = matrix.split(';').length
      columns = matrix.split(';')[0].split(' ').length
      newmat = ''
      for i in 0..columns - 1
        newmat = ''
        for j in 0..rows - 1
          newmat = newmat + "\t" + matrix.split(';')[j].split(' ')[i]
        end
        @trans << "#{newmat}\n"
        puts "\t#{newmat}".yellow
      end
      @@saved << "Matrix transposed. #{Time.new.inspect}\n a = #{@trans}\n#{@@dot}\n".yellow
     end

    def inverse(mat)
      @inverse = ''
      if mat.split(';').length == 2
        puts 'inverse(a) = '.yellow
        a = mat.split(';')[0].split(' ')[0].to_i
        b = mat.split(';')[0].split(' ')[1].to_i
        c = mat.split(';')[1].split(' ')[0].to_i
        d = mat.split(';')[1].split(' ')[1].to_i
        det = (a * d) - (b * c)
        @inverse << "#{a / det.to_f}\t#{-1 * c / det.to_f}\n#{-1 * b / det.to_f}\t#{d / det.to_f}".yellow
        puts @inverse
        @@saved << "Matrix inversed. #{Time.new.inspect}\n 'inverse(a) = #{@inverse}\n#{@@dot}\n".yellow
      else mat.split(';').length > 2
           raise 'System can only compute for a 2 * 2 matrix'.red
      end
    end

    def concat(mata, matb, operator)
      @result = ''
      if operator == ','
        @verconcat = ''
        mata.split(';').each do |x|
          @verconcat << "#{x}\n"
        end
        matb.split(';').each do |y|
          @verconcat << "#{y}\n"
        end
        puts "[[#{mata}],[#{matb}]= \n#{@verconcat}".yellow
        @@saved << "Matrix inversed. #{Time.new.inspect}\n [[#{mata}],[#{matb}]= \n#{@verconcat}\n#{@@dot}\n".yellow
      elsif operator == ';'
        @horconcat = ''
        rowa = mata.split(';').length
        rowb = matb.split(';').length
        for i in 0..rowa - 1
          newmat = ''
          newmat << mata.split(';')[i] << ' ' << matb.split(';')[i]
          @horconcat << "#{newmat}\n".yellow
        end
        puts "[[#{mata}];[#{matb}]= \n#{@horconcat}".yellow
        @@saved << "Matrix inversed. #{Time.new.inspect}\n [[#{mata}];[#{matb}]= \n #{@horconcat}\n#{@@dot}\n".yellow
      else
        puts 'You have enetered an invalid matrix or type of concatenation'.red
      end
    end

    def save(input)
      if /^save > (\w+).mat$/ =~ input
        if File.exist?(input.gsub!('save > ', ''))
          File.open(input, 'a') do |file|
            file.puts @@saved
            puts 'Saved'.yellow
          end
        else
          newfile = File.new(input, 'w')
          newfile.syswrite(@@saved)
          puts 'Saved'.yellow
        end
      else
        puts 'Please save using this command: save > filename.mat'.red
      end
    end

    def load(input)
      if /^load (\w+).mat$/ =~ input
        if File.exist?(input.gsub!('load ', ''))
          newfile = File.new(input, 'r')
          content = newfile.read
          puts content.to_s.yellow
        else
          raise 'File does not exist'.red
        end
      else
        raise 'Please load using this command: load filename.mat'.red
      end
    end
  end
 end
