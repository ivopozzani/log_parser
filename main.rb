require_relative "./lib/log_parser.rb"

file_path = "games.log"

read_first_line = LogParser.new(file_path)

print read_first_line.read_first_line


