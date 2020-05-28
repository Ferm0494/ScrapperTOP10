require_relative '../lib/games.rb'
require_relative '../lib/game.rb'
require_relative '../lib/web.rb'
describe Games do
  games = Games.new
  page = Web.new('https://www.stuff.tv/top-10/playstation-4-games')
  game = Game.new(page.doc)
  describe '#push' do
    it 'Returns true when an object of type : game  is passed' do
      expect(games.push(game)).to eql true
    end

    it 'Returns fals if an object not of type game is passed' do
      expect(games.push(4)).to eql false
      expect(games.push([1, 2, 3])).to eql false
    end
  end
end
