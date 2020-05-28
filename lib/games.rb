require 'yaml'
class Games
    attr_reader :games
    def initialize()
        @games = Array.new
        @count= 0
    end

    def get_data()
        objects = String.new
        @games.each_with_index{
            |data,index|
            objects += data.to_yaml.gsub("--- !ruby/object:Game","---Game: #{index+1}----")
        }
        objects
    end

    def push(object)
        if object.is_a?(Object)
                @games[@count] = object
                @count += 1
        else
            return false
        end
    end
end

