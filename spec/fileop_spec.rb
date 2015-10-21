require_relative "spec_helper"

include Hangman

describe FileOp do

  before :each  do
    @game = Game.new
    @engine = Engine.new(@game)
    @file_op = FileOp.new(@engine, @game)
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@file_op).to be_a FileOp
    end
  end

  describe "#to_h" do
    it "returns a Hash of data to save" do
      expect(@file_op.to_h).to be_kind_of(Hash)
    end
  end

  #describe "#" do


end
