require('rspec')
require('pry-nav')
require('definition')
require('word')

describe(Word) do
  before() do
    Word.clear()
    @word1 = Word.new(:word_name => 'bananza')
    @word1.save()

    @word2 = Word.new(:word_name => 'quixotic')
    @word2.save()

    @word3 = Word.new(:word_name => 'Apple')
    @word3.save()
  end

  describe('#initialize') do
    it('can retrieve information for a new word') do
      expect(@word1.word_name()).to eq('Bananza')
    end
  end
  describe('#find') do
    it('can find word based on its unique id in the words array') do
      expect(Word.find(@word2.id())).to eq(@word2)
    end
  end
  describe('#add_word_definition') do
    it('will add a words definition to an array') do
      test_definition = Definition.new(:definition_sentence => "To delibrately sneeze in public to bring attention to onseself", :part_of_speech => "verb")
      test_definition.save()
      @word1.add_word_definition(test_definition)
      expect(@word1.word_definition()).to eq([test_definition])
    end
  end
  describe('#sort_word') do
    it('Can sort words in alphabetical order and capilize them') do

      Word.sort_word()
      expect(Word.all()).to eq([@word3, @word1, @word2])
    end
  end
end
