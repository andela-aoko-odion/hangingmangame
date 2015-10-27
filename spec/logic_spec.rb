
require_relative 'spec_helper'
require "./logic"

describe HangmanAndrew::Game do
  let(:game) {HangmanAndrew::Game.new}
  before :each do
    allow_message_expectations_on_nil
    allow(game).to receive(:puts).and_return nil
    allow(game).to receive(:gets).and_return("p")
  end

  it "returns an instance of Game" do
      @game.should be_an_instance_of(Game)
    end

    describe "#find_index" do
      it "returns the index of the characters supplied" do
        expect(@game.find_index("helloworld")["l"]).to eql([2, 3, 8])
      end
    end

    describe "#update_scrambled" do
      it "returns an updated scrambled word" do
        index = @game.find_index("helloworld")
        expect(@game.update_scrambled(index, "__________", 'l')).to eql([2, 3, 8])
      end
    end

    describe "#winner" do
      it "returns true if player wins" do
        expect(@game.winner([])).to eql(true)
      end
    end

    # describe "#loser" do
      #   it "return true if player lose" do
      #     allow(@game).to recieve(@lives).and_return(true)
      #     expect(@game.loser).to eql(true)
      #   end
      # end

      describe "#check_input" do
        it "update scrambled word with correctly guessed letter, and returns its index" do
          indx = @game.find_index("helloworld")
          expect(@game.check_input(indx, "__________", "r")).to eql([7])
        end
      end

      # describe "#actions_allowed" do
      #   it "should be instance of Hash" do
      #     expect(@game.actions_allowed).to be_an_instance_of(Hash)
      #   end
      # end

      # describe "#quit_game" do
      #   it "should puts I want to quit your game" do
      #      STDOUT.should_receive(:puts).with('Hello from RSpec')
      #     end
      #   end

    end
