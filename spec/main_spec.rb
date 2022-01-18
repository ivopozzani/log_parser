require 'main'
describe 'ReadFile' do
    it 'prints first line' do
        file = ReadFile.new
        expect(file.print_first_line).to be_falsey
    end
end
