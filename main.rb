require_relative './lib/log_parser'

file_path = 'games.log'

parse_file = LogParser.new(file_path)

print parse_file.parse_file
