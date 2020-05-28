require 'yaml'
class Games
  attr_reader :games
  def initialize()
    @games = []
    @count = 0
  end

  def data()
    objects = ''
    @games.each_with_index do |data, index|
      objects += data.to_yaml.gsub('--- !ruby/object:Game', "---Game: #{index + 1}----")
    end
    objects
  end

  def push(object)
    if object.is_a?(Game)
      @games[@count] = object
      @count += 1
      true
    else
      false
    end
  end
end
