require('rspec')
require('pry-nav')
require('definition')
require('word')

describe(Word) do
  before() do
    Word.clear()
    @word1 = Word.new(:word => 'Bananza')
    @word1.save()

    @word2 = Word.new(:word => 'Quixotic')
    @word2.save()
  end

  describe('#initialize') do
    it('can retrieve information for a new word') do
      expect(@word1.word()).to eq('Bananza')
    end
  end
  describe('#find') do
    it('can find word based on its unique id in the words array') do
      expect(Word.find(@word2.id())).to eq(@word2)
    end
  end
  describe('#add_word_definition') do
    it('will add a words definition to an array') do
      test_definition = Definition.new(:definition => "To delibrately sneeze in public to bring attention to onseself")
      test_definition.save()
      @word1.add_word_definition(test_definition)
      expect(@word1.word_definition()).to eq([test_definition])
    end
  end
end
