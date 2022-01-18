class ReadFile
    attr_accessor :file_path
    
    def initialize
       @file_path = "/home/ivo/Documents/Codeminer42/Trainee/Ruby/log_parser/games.log"
       @file = File.open(@file_path)
    end
    
    def print_first_line
        print @file.readline
    end       
end