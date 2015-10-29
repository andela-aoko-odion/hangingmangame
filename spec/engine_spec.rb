require "spec_helper"

describe Hangman::Engine do
  let(:engine){Hangman::Engine.new}

  describe "#pick" do
    it "picks a word from the dictionary" do
      expect(engine.pick).to be_kind_of String
    end
  end

  describe "#pick_word" do
    it "checks if word lenght is greater than 10 and less than 12" do
      allow(engine).to receive(:pick).and_return("helloworld")
      expect(engine.pick_word).to eq("helloworld")
    end
  end
end
