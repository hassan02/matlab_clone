class Valid
  # Class to check validity of string
  def check_array(array)
    if /^\d+(\s\d+)*$/ =~ array
      true
    else
      false
    end
  end

  def check_mat_correct(matrix)
    
    matrix.split(';').each do |x|
      if /^\d+(\s\d+)*$/ =~ x
        true
      else
        false
        break
       end
      
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
    if /^\d+$/ =~ num
             true
           else
             false
           end
  end

  def check_concat(_mata, _matb, operator)
    if operator == ',' || operator == ';'
      true
    else
      false
    end
  end

def save_to(input)
    File.open(input, "a") do |file|
    file.puts content
    end
end
end
