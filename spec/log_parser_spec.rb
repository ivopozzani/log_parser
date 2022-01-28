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
      expect(file.parse_file).to be == { './spec/fixtures/game_test.log' => {
        'kills' => { 'Dono da Bola' => 2, 'Isgalamido' => 2,
                     'Mocinha' => 1 }, 'lines' => 13, 'players' => ['Isgalamido', 'Dono da Bola', 'Mocinha'], 'total_kills' => 7
      } }
    end
  end
end
