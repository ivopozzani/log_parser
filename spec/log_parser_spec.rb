require 'log_parser'

describe 'ReadFile' do
  describe '#read_first_line' do
    it 'prints first line' do
       file = LogParser.new("games.log")
       expect(file.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")      
    end

    it 'checks file path' do
       expect { LogParser.new("games.txt") }.to raise_error(RuntimeError, "File not found")
    end
  end
end
