require 'json'

class LogParser
  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
    raise 'File not found' unless File.exist?(@file_path)

    @file = File.open(@file_path)
  end

  def read_first_line
    first_line = @file.readline
    @file.close
    first_line
  end

  def parse_file
    parse_json = JSON.generate({ @file_path => { 'lines' => line_counter, 'players' => find_players } })
    @file.close
    parse_json
  end

  private

  def line_counter
    @file.readlines.length
  end

  def find_players
    players = []
    File.foreach(@file_path).each do |line|
      if line.include?('ClientUser')
        player_name = line.slice(/\\(\w+\s*)+/).delete_prefix('\\')
        players << player_name unless players.include?(player_name)
      end
    end
    players
  end
end
