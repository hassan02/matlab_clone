class Valid
  # Class to check validity of string
  def inv2_2(mat)
    n = mat.split(';')[0].split(' ').length
    a = mat.split(';')[0].split(' ')[0].to_i
    b = mat.split(';')[0].split(' ')[1].to_i
    c = mat.split(';')[1].split(' ')[0].to_i
    d = mat.split(';')[1].split(' ')[1].to_i
    det = (a * d) - (b * c)
    puts "#{a / det.to_f}\t#{-1 * c / det.to_f}\n#{-1 * b / det.to_f}\t#{d / det.to_f}"
      end
  def inv3_3(mat)
  end
  def getelement(mat)
    a = mat.split(';')[0].split(' ')[0].to_i
    b = mat.split(';')[0].split(' ')[1].to_i
    c = mat.split(';')[0].split(' ')[2].to_i
    d = mat.split(';')[0].split(' ')[0].to_i
    e = mat.split(';')[0].split(' ')[1].to_i
    f = mat.split(';')[0].split(' ')[2].to_i
    g = mat.split(';')[0].split(' ')[0].to_i
    h = mat.split(';')[0].split(' ')[1].to_i
    i = mat.split(';')[0].split(' ')[2].to_i
  end
  
  def get determinant(mat)
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

  def ver_concat(mata, matb, _operator)
    @verconcat = ''
    mata.split(';').each do |x|
      @verconcat << "#{x}\n"
    end
    matb.split(';').each do |y|
      @verconcat << "#{y}\n"
    end
    puts '[a;b] = '.yellow
    puts @verconcat.to_s.yellow
  end

  def hor_concat(mata, matb, _operator)
    @horconcat = ''
    rowa = mata.split(';').length
    rowb = matb.split(';').length
    for i in 0..rowa - 1
      newmat = ''
      newmat << mata.split(';')[i] << ' ' << matb.split(';')[i]
      @horconcat << "#{newmat}\n".yellow
    end
    puts @horconcat
end
end
