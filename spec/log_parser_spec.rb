require 'log_parser'

describe LogParser do
  describe '#initialize' do
    it 'checks file path' do
      expect { LogParser.new('games.txt') }.to raise_error(RuntimeError, 'File not found')
    end
  end

  describe '#read_first_line' do
    it 'prints first line' do
      file = LogParser.new('./spec/fixtures/game_test.log')
      expect(file.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")
    end
  end

  describe '#parse_file' do
    let(:file) { LogParser.new('./spec/fixtures/game_test.log') }

    it 'returns JSON object' do
      expect(file.parse_file).to include('{"./spec/fixtures/game_test.log":{"lines":5,"players":["Isgalamido","Dono da Bola","Mocinha')
    end
  end
end
