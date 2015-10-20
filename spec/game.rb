require_relative "spec_helper"

RSpec.describe Hangman::Engine do

  before(:each) do
    @game = Engine.new
  end

  describe "#pick_random_word" do

    it "check if its an instance of the Engine class" do
      expect(@game).to be_instance_of(Engine)
    end

    it "check wether word was picked or nill" do
       word = @game.pick_random_word
      expect(word.should) != nil
    end

    it "check to ensure its a string" do
       word = @game.pick_random_word
      word.should be_kind_of(String)
    end

   it "check to ensure its not a number" do
       word = @game.pick_random_word
      word.should_not be_kind_of(Fixnum)
    end
  end

  describe "#word_length" do

    it "returns is not empty" do
      word = @game.pick_random_word
      len = @game.word_length
      expect(len.should) != nil
    end

    it "should be greater than zero" do
       word = @game.pick_random_word
      len = @game.word_length
      expect(len).to be > 0
    end

     it "it should be a number" do
      word = @game.pick_random_word
      len = @game.word_length
      len.should be_kind_of(Fixnum)
    end

    it "check to ensure its not a string" do
      word = @game.pick_random_word
      len = @game.word_length
      len.should_not be_kind_of(String)
    end

      describe "#is_word_valid?" do

        it "should be true" do
          word = @game.pick_random_word
          expect(@game.is_word_valid?).to be true
        end

        it "should not be nil" do
          word = @game.pick_random_word
          expect(@game.is_word_valid?.should) != nil
        end
      end

      describe "#generate_random_word" do

        it "should be an instance of Engine" do
        expect(@game).to be_instance_of(Engine)
        end

        it "should be not be empty" do
          word = @game.generate_random_word
          expect(word).should_not be nil
        end

        it "should be a string" do
          word = @game.generate_random_word
          word.should_not be_kind_of(Fixnum)
        end
      end
    end
  end
end
