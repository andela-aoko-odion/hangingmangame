
require 'spec_helper'
describe Hangman::Game do
  let(:game) {Hangman::Game.new}
  before :each do
    allow_message_expectations_on_nil
    allow(game).to receive(:puts).and_return nil
    allow(game).to receive(:gets).and_return nil

  end

  describe "#find_index" do
    it "returns an hash of the index of selected word" do
      expect(game.find_index("hello")).to eql({"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]})
    end
  end

  describe "#populate_scramble" do
    it "returns an updated scrambled word" do
      index = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      expect(game.populate_scramble(index, "_____", 'l')).to eql([2,3])
    end
  end

  describe "#winner" do
    it "returns true if player wins" do
      expect(game.winner([])).to eql(true)
    end
  end

  describe "#loser" do
    it "checks if player losses" do
      expect(game.loser).to eql(false)
    end
  end

  describe "#check_input" do
    it "update scrambled word with correctly guessed letter, and returns its index" do
      find_index = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      expect(game.check_input(find_index, "_____", "e")).to eql([1])
    end

    it "tell if input is wrong" do
      find_index = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      allow(game).to receive(:incorrect_input).and_return("incorrect")
      expect(game.check_input(find_index, "__________", "z")).to eql("incorrect")
    end
  end

  describe "#actions_allowed" do
    it "should put I want to quit your game" do
      expect(game.actions_allowed).to eql({'#' => :quit_game,'*' => :save_game})
    end
  end

  describe "#analyze_game_input" do
    it "analyzes winner and starts" do
      allow(game).to receive(:winner).and_return(true)
      allow(game).to receive(:start).and_return("started")
      expect(game.analyze_game_input({"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]})).to eql("started")
    end
    it "analyzes loser quit" do
      word = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      allow(game).to receive(:loser).and_return(true)
      allow(game).to receive(:start).and_return("started")
      expect(game.analyze_game_input(word)).to eql("started")
    end

  end



  describe "#play" do
    it "plays the game" do
      char = "h"
      scrambled_word = "____"
      word = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      allow(game).to receive(:check_input).and_return("checked")
      expect(game.play(char,word,scrambled_word )).to be nil
    end

    it "quits on #" do
      char = "#"
      scrambled_word = "____"
      word = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      expect{game.play(char,word,scrambled_word )}.to raise_error SystemExit
    end
  end

  describe "#play_new" do
    it "plays new game" do
      char = "h"
      scrambled_word = "____"
      word = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
      allow(game).to receive(:play).and_return("played")
      expect(game.play(char,word,scrambled_word )).to eql("played")
    end
  end

  describe "#start" do
    it "starts new game" do
      allow(game).to receive(:gets).and_return("n")
      allow(game).to receive(:play_new).and_return("played")
      expect(game.start).to eql("played")
    end
  end

end
