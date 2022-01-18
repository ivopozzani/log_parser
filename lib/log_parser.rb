class LogParser
    attr_accessor :file_path
    
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
end
