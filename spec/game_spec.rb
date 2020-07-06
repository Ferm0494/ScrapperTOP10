require_relative '../lib/game.rb'
require_relative '../lib/web.rb'

describe Game do
  page = Web.new('https://www.stuff.tv/top-10/playstation-4-games')
  game = Game.new(page.doc)
  describe '#title' do
    it 'Returns String if param is not empty' do
      expect(game.title('Greetings!')).to be_an(String)
    end

    it 'Returns false if param is empty' do
      expect(game.title('')).to eql(false)
    end
  end

  describe '#description' do
    it 'Returns String if param is not empty' do
      expect(game.description('Greetings!')).to be_an(String)
    end

    it 'Returns false if param is empty' do
      expect(game.description('')).to eql(false)
    end
  end

  describe '#price' do
    it 'Returns String if param is not empty' do
      expect(game.price('Greetings!')).to be_an(String)
    end

    it 'Returns false if param is empty' do
      expect(game.price('')).to eql(false)
    end

    describe '#img' do
      it 'Returns First String if param is not empty' do
        expect(game.img('Greetings! World')).to be_an(String)
        expect(game.img('Greetings! World')).to eql('Greetings!')
      end

      it 'Returns false if param is empty' do
        expect(game.price('')).to eql(false)
      end
    end

    describe '#rating' do
      it 'Returns an integer if a param being sent' do
        expect(game.rating('5', '4')).to eql(5)
        expect(game.rating('', '4')).to eql(4)
        expect(game.rating('5', '')).to eql(5)
      end

      it 'Returns false if  BOTH params are empty' do
        expect(game.rating('', '')).to eql(false)
      end
    end
  end
end
