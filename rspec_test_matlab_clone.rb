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
               expect {test.load('load new.ma')}.to raise_error 'Please load using this command: load filename.mat'.red
            end

            it 'should check for incorrect command format' do
               expect {test.load('loadnew.ma')}.to raise_error 'Please load using this command: load filename.mat'.red
            end

            it 'should return error for non-digit input for rows' do
               expect {test.zeros('r','5')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
            end
            it 'should return error for non-digit input for colums' do
               expect {test.zeros('5','e')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
            end
    
    end
end
=begin
    context 'checks if notes is an instance property' do
            newnote = NotesApplication.new ("Hassan")

            it 'should returns notes list to be empty' do
                expect(newnote.notes).to eq []
            end

    end

    context "Checks if method" do
        newauthor = NotesApplication.new("Hassan")

        newauthor.create("Ruby is interesting")
        newauthor.create("Andela is wonderful")
        newauthor.create("I am enjoying bootcamp")
        newauthor.create("I love Andela")
    end

    context "Checks if method"
        it 'initialize returns name of author' do 
            expect(newauthor.author).to eq "Hassan"
        end

        it 'get returns notes with index 0' do
            expect(newauthor.get(0)).to eq "Ruby is interesting"
        end

        it 'get returns notes with index 1' do
            expect(newauthor.get(1)).to eq "Andela is wonderful"
        end

        it 'get returns notes with index 2' do
            expect(newauthor.get(2)).to eq "I am enjoying bootcamp"
        end

        it 'get returns notes with index 3' do
            expect(newauthor.get(3)).to eq "I love Andela"
        end

        
        it 'get raise error if note_id is not an integer' do
           expect {newauthor.get("one")}.to raise_error "Note Id should be an Integer"
        end

        it 'get raise error if note_id is not an integer' do
           expect {newauthor.get('@')}.to raise_error "Note Id should be an Integer"
        end
    end

    context "Checks if method"
        it 'edit returns error if get first parameter i.e note_id is not an integer' do 
            expect {newauthor.edit("zero","Who says Ruby is interesting")}.to raise_error "Note Id should be an Integer"
        end

        it 'edit edit the the note given the index and the new content' do
            expect {newauthor.edit(0,"Who says Ruby is interesting")}.to change {newauthor.get(0)}. from("Ruby is interesting").to("Who says Ruby is interesting")
        end
    end
        it 'delete raise error if note_id is a string' do
            expect {newauthor.delete("1")}.to raise_error "Note Id should be an Integer"
        end
        
        it 'delete raise error if note_id is not an Integer' do
            expect {newauthor.delete(nil)}.to raise_error "Note Id should be an Integer"
        end
        

        it 'delete delete note at index 2' do
            expect {newauthor.delete(3)}.to change {newauthor.notes.length}.from(4).to(3)
        end

        it 'get should return note at index 2' do
            expect(newauthor.get(2)).to eq "I am enjoying bootcamp"
        end

        

    end

end
=end