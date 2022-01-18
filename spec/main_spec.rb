require 'main'
describe 'ReadFile' do
    it 'prints first line' do
        file = ReadFile.new
        expect(file.print_first_line).to be_falsey
    end

    it 'checks file path' do
        file = ReadFile.new
        file.file_path = ''
        expect { raise "File not found" }.to raise_error(RuntimeError, "File not found")
    end
end
