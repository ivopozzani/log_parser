require 'log_parser'

describe LogParser do
  describe '#initialize' do
    it 'checks file path' do
      expect { LogParser.new("games.txt") }.to raise_error(RuntimeError, "File not found")
   end
  end

  describe '#read_first_line' do
    it 'prints first line' do
       file = LogParser.new("games.log")
       expect(file.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")      
    end
  end

  describe '#parse_file' do    
    it 'returns JSON object' do
      file = LogParser.new("games.log")
      expect(file.parse_file).to include("{\"games.log\":{\"lines\":")
    end

    it 'returns number of file lines in JSON object' do
      file = LogParser.new("games.log")
      expect(file.parse_file).to include("{\"games.log\":{\"lines\":5306}}")
    end
  end
end
