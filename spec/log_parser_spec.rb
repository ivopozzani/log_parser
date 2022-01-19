require 'log_parser'

describe 'LogParser' do
  describe '#read_first_line' do
    it 'prints first line' do
       file = LogParser.new("games.log")
       expect(file.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")      
    end

    it 'checks file path' do
       expect { LogParser.new("games.txt") }.to raise_error(RuntimeError, "File not found")
    end
  end

  describe '#parse_file' do
    it 'counts log lines' do
      file = LogParser.new("games.log")
      expect(file.parse_file).to include("{\"games.log\":{\"lines\":")
    end
  end
end
