class LogParser
  attr_accessor :file_path
  require "json"
    
  def initialize(file_path)
    @file_path = file_path
    raise "File not found" unless File.exists?(@file_path)
    @file = File.open(@file_path)
    @line_count = 0    
  end
    
  def read_first_line
    first_line = @file.readline
    @file.close
    first_line        
  end

  def line_counter
    for line in @file.readlines
      @line_count += 1
    end
    @line_count
  end
  
  def parse_file    
    parse_json = JSON.generate({@file_path => {"lines" => line_counter}})
    @file.close
    parse_json
  end
end
