require_relative './lib/log_parser'
require 'json'

file_path = 'games.log'

parse_file = LogParser.new(file_path)

print JSON.generate(parse_file.parse_file)
