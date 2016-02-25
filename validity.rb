class Valid
  # Class to check validity of string
  def inv2_2(mat)
      end

  def inv3_3(mat)
  end

  def check_array(array)
    if /^\d+(\s\d+)*$/ =~ array
      true
    else
      false
    end
  end

  def check_mat_correct(matrix)
    stat = false
    matrix.split(';').each do |x|
      if /^\d+(\s\d+)*$/ =~ x
        true
      else
        false
        break
       end
      return stat
    end
  end

  def check_mat_length(matrix)
    newx = matrix.split(';')[0].split(' ').length
    matrix.split(';').each do |x|
      if x.split(' ').length == newx
        true
      else
        false
        break
      end
    end
    stat
     end

  def check_digit(num)
    stat = if /^\d+$/ =~ num
             true
           else
             false
           end
  end

  def check_concat(_mata, _matb, operator)
    if operator == ',' || operator == ';'
      # elsif check_mat_correct(mata) == true && check_mat_length(mata) == true
      # elsif check_mat_correct(matb) == true && check_mat_correct(matb) == true
      true
    else
      false
    end
  end

  def hor_concat(mata, matb, _operator)
    @matamatb = ''
    mata.split(';').each do |x|
      @matamatb << "#{x}\n"
    end
    matb.split(';').each do |y|
      @matamatb << "#{y}\n"
    end
    end
  puts '[a;b] = '.yellow
  puts @matamatb.to_s.yellow
end
