require_relative 'spec_helper'
include Hangman

describe Engine do

  before(:each) do
    @engine = Engine.new
  end

  it "should be true" do
    @engine.should_not be_nil
  end

  describe "#pick" do
    it "returns a string type" do
      expect(@engine.pick).to be_an_instance_of(String)
    end
  end

  describe "#pick_word" do
    it "return a word of length >5 & <=12" do
      expect(@engine.pick_word.length).to be > 5
    end
  end

end
