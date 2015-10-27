require 'spec_helper'

describe HangmanAndrew::Logic do

  let(:logic) { Class.new.extend(HangmanAndrew::Logic)}
  before :each do
    allow_message_expectations_on_nil
    allow(logic).to receive(:puts).and_return nil
    allow(logic).to receive(:gets).and_return nil
  end

  describe "#find_index" do
    it "returns an hash of the index of selected word" do
      expect(logic.find_index("hello")).to eql({"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]})
    end
  end

  describe "#update_scrambled" do
    it "returns an updated scrambled word" do
      index = logic.find_index("helloworld")
      expect(logic.update_scrambled(index, "__________", 'l')).to eql("__ll____l_")
    end
  end

  describe "#winner" do
    it "returns true if player wins" do
      expect(logic.winner([])).to eql(true)
    end
  end



      describe "#check_input" do
        it "update scrambled word with correctly guessed letter, and returns its index" do
          find_index = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
          expect(logic.check_input(find_index, "__________", "e")).to eql("_e________")
        end

        it "tell if input is wrong" do
          find_index = {"h"=>[0], "e"=>[1], "l"=>[2, 3], "o"=>[4]}
          allow(logic).to receive(:incorrect_input).and_return("incorrect")
          expect(logic.check_input(find_index, "__________", "z")).to eql("incorrect")
        end
      end

    

      # describe "#quit_game" do
      #   it "should puts I want to quit your game" do
      #      STDOUT.should_receive(:puts).with('Hello from RSpec')
      #     end
      #   end

    end
