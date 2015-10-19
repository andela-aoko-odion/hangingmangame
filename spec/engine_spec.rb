require_relative 'spec_helper'
include Hangman

RSpec.describe Engine do

  before(:each) do
    @game = Game.new
    @engine = Engine.new(@game)
  end

  describe "#pick_random_word" do
    it "should be instance of Engine" do
      expect(@engine).to be_instance_of(Engine)
    end

    it "check wether word was picked or nill" do
       word = @engine.pick_random_word
      expect(word.should) != nil
    end

    it "check to ensure its a string" do
       word = @engine.pick_random_word
      word.should be_kind_of(String)
    end

   it "check to ensure its not a number" do
       word = @engine.pick_random_word
      word.should_not be_kind_of(Fixnum)
    end
  end

  describe "#word_length" do
    it "returns is not empty" do
      word = @engine.pick_random_word
      len = @engine.word_length
      expect(len.should) != nil
    end

    it "should be greater than zero" do
       word = @engine.pick_random_word
      len = @engine.word_length
      expect(len).to be > 0
    end

     it "it should be a number" do
      word = @engine.pick_random_word
      len = @engine.word_length
      len.should be_kind_of(Fixnum)
    end

    it "check to ensure its not a string" do
      word = @engine.pick_random_word
      len = @engine.word_length
      len.should_not be_kind_of(String)
    end

      describe "#is_word_valid?" do
        it "should be true" do
          word = @engine.pick_random_word
          expect(@engine.is_word_valid?).to be true
        end

        it "should not be nil" do
          word = @engine.pick_random_word
          expect(@engine.is_word_valid?.should) != nil
        end
      end

      describe "#generate_random_word" do

        it "should be an instance of Engine" do
        expect(@engine).to be_instance_of(Engine)
        end

        it "should not be empty" do
          word = @engine.generate_random_word
          expect(word).should_not be nil
        end

        it "should not be of type Fixnum" do
          word = @engine.generate_random_word
          word.should_not be_kind_of(Fixnum)
        end
      end

      describe "#words_array" do
        it "it should returns an Array object" do
          @game.game_word = "hello"
          arr = @engine.words_array
           arr.class.should be an_instance_of(Array)
        end
      end

  end
end
