class LogParser
  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
    raise 'File not found' unless File.exist?(@file_path)

    @file = File.open(@file_path)
    @players = []
    @player_score = {}
    @total_kills = 0
  end

  def read_first_line
    first_line = @file.readline
    @file.close
    first_line
  end

  def parse_file
    parse_json = { @file_path => { 'lines' => line_counter, 'players' => find_players,
                                   'kills' => kills_list, 'total_kills' => @total_kills } }
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

  def player_kill_list
    find_players if @players.empty?
    @players.each { |player| @player_score[player] = 0 }
  end

  def kills_list
    player_kill_list if @player_score.empty?
    File.foreach(@file_path).each do |line|
      next unless line.include?('Kill')

      killer_name = line.slice(/[<?\w+\s*>?]+(?=\skilled)/).delete_prefix("\s")
      if @player_score.key? killer_name
        @player_score[killer_name] += 1
        @total_kills += 1
      end
    end
    @player_score
  end
end
