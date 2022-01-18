require 'log_parser'
describe 'ReadFile' do
    it 'prints first line' do
        file = LogParser.new("games.log")
        expect(file.read_first_line).to be_kind_of(String)
    end

    it 'checks file path' do
        file = LogParser.new("games.log")
        file.file_path = ''
        expect { raise "File not found" }.to raise_error(RuntimeError, "File not found")
    end
end
