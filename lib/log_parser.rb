require 'json'

class LogParser
  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
    raise 'File not found' unless File.exist?(@file_path)

    @file = File.open(@file_path)
    @players = []
    @players_kills = {}
    @total_kills = 0
  end

  def read_first_line
    first_line = @file.readline
    @file.close
    first_line
  end

  def parse_file
    parse_json = JSON.generate({ @file_path => { 'lines' => line_counter, 'players' => find_players,
                                                 'kills' => kills_list, 'total_kills' => @total_kills } })
    @file.close
    parse_json
  end

  private

  def line_counter
    @file.readlines.length
  end

  def find_players
    File.foreach(@file_path).each do |line|
      if line.include?('ClientUser')
        player_name = line.slice(/\\(\w+\s*)+/).delete_prefix('\\')
        @players << player_name unless @players.include?(player_name)
      end
    end
    @players
  end

  def players_to_hash
    find_players if @players.empty?
    @players.each { |player| @players_kills[player] = 0 }
  end

  def kills_list
    players_to_hash if @players_kills.empty?
    File.foreach(@file_path).each do |line|
      next unless line.include?('Kill')

      killer_name = line.slice(/[<?\w+\s*>?]+(?=\skilled)/).delete_prefix("\s")
      if @players_kills.key? killer_name
        @players_kills[killer_name] += 1
        @total_kills += 1
      end
    end
    @players_kills
  end
end
