require './matlabclone'
include Hassan

RSpec.describe "Matlabclone" do
    test = MatLabclone.new()

    context 'method create_arr' do 
           
            
            it 'should return error for string array' do
               expect {test.create_arr('d e h')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
            end

            it 'should return error for string and number array' do
               expect {test.create_arr('d 4 h')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
            end

            it 'should return error for unformatted number array' do
               expect {test.create_arr('3 4   5')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
            end

            it 'should return error for wrong array input' do
               expect {test.create_arr('2 3 4;5 6 7')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
            end
    end

    context 'method zeros' do 
           
            
            it 'should return error for rows = 0' do
               expect {test.zeros('0','3')}.to raise_error 'Invalid. Number of rows or columns cannot be zero'.red
            end

            it 'should return error for columns = 0' do
               expect {test.zeros('4','0')}.to raise_error 'Invalid. Number of rows or columns cannot be zero'.red
            end

            it 'should return error for non-digit input for rows' do
               expect {test.zeros('r','5')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
            end
            it 'should return error for non-digit input for colums' do
               expect {test.zeros('5','e')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
            end
    
    end
    context 'method load' do 
           
            
            it 'should check for incorrect command format' do
               expect {test.load(' load new.mat')}.to raise_error 'Please load using this command: load filename.mat'.red
            end

            it 'should check for incorrect command format' do
               expect {test.load('loadnew.mat')}.to raise_error 'Please load using this command: load filename.mat'.red
            end

            it 'should check for incorrect extension' do
               expect {test.load('load new.txt')}.to raise_error 'Please load using this command: load filename.mat'.red
            end

            it 'should check for incorrect extension' do
               expect {test.load('load new.matrix')}.to raise_error 'Please load using this command: load filename.mat'.red
            end
            
    
    end
    context 'method inverse' do 

            it 'should check for 3 * 3 matrix' do
               expect {test.inverse('1 2 3;4 5 6;7 8 9')}.to raise_error 'System can only compute for a 2 * 2 matrix'.red
            end

            it 'should check for 4 * 4 matrix' do
               expect {test.inverse('1 2 3 4;4 5 6 7;7 8 9 10;11 12 13 14')}.to raise_error 'System can only compute for a 2 * 2 matrix'.red        
            end
            
            it 'should check for 5 * 5 matrix' do
               expect {test.inverse('1 2 3 4 5;4 5 6 7 8;7 8 9 10 11;12 13 14 15 16;17 18 19 20 21')}.to raise_error 'System can only compute for a 2 * 2 matrix'.red
            end

    
    end
end