class LogParser
  attr_accessor :file_path
  require "json"
    
  def initialize(file_path)
    @file_path = file_path
    raise "File not found" unless File.exists?(@file_path)
    @file = File.open(@file_path)       
  end
    
  def read_first_line
    first_line = @file.readline
    @file.close
    first_line        
  end
  
  def parse_file
    line_count = 0
    for line in @file.readlines do
      line_count += 1
    end
    @file.close
    parse_json = JSON.generate({@file_path => {"lines" => line_count}})
    parse_json
  end
end
