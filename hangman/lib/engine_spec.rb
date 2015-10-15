#require "./spec_helper"
require "rspec"
require "./engine"



RSpec.describe GameEngine do

  before(:each) do
    @game = GameEngine.new
  end

  describe "#pick_random_word_from_dictionary" do

    it "check if its an instance of the GameEngine class" do
      expect(@game).to be_instance_of(GameEngine)
    end

    it "check wether word was picked or nill" do
       word = @game.pick_random_word_from_dictionary
      expect(word.should) != nil
    end

    it "check to ensure its a string" do
       word = @game.pick_random_word_from_dictionary
      word.should be_kind_of(String)
    end

   it "check to ensure its not a number" do
       word = @game.pick_random_word_from_dictionary
      word.should_not be_kind_of(Fixnum)
    end
  end

  describe "#length_of_word" do

    it "returns is not empty" do
      word = @game.pick_random_word_from_dictionary
      len = @game.length_of_word
      expect(len.should) != nil
    end

    it "should be greater than zero" do
       word = @game.pick_random_word_from_dictionary
      len = @game.length_of_word
      expect(len).to be > 0
    end

     it "it should be a number" do
      word = @game.pick_random_word_from_dictionary
      len = @game.length_of_word
      len.should be_kind_of(Fixnum)
    end

    it "check to ensure its not a string" do
      word = @game.pick_random_word_from_dictionary
      len = @game.length_of_word
      len.should_not be_kind_of(String)
    end

      describe "#word_is_valid?" do

        it "should be true" do
          word = @game.pick_random_word_from_dictionary
          expect(@game.word_is_valid?).to be true
        end

        it "should not be nil" do
          word = @game.pick_random_word_from_dictionary
          expect(@game.word_is_valid?.should) != nil
        end
      end

      describe "#generate_random_word" do

        it "should be an instance of GameEngine" do
        expect(@game).to be_instance_of(GameEngine)
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
