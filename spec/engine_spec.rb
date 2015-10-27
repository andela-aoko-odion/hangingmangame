require "spec_helper"

describe HangmanAndrew::Engine do
  let(:engine){HangmanAndrew::Engine::Generator.new}
  before :each do

  end

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
    it "word length is greater than > 5" do
      allow(engine).to receive(:pick).and_return("helloworld")
      expect(engine.pick_word.length).to be > 5
    end
    it "should return a type String" do
      allow(engine).to receive(:pick).and_return("helloworld")
      expect(engine.pick_word).to be_kind_of String
    end
  end
end
