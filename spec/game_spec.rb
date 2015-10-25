require_relative 'spec_helper'
include Hangman

describe Game do
  let(:game) {@game = Game.new}

  before(:each) do
    @game = Game.new
    @engine = Engine.new(self)
    @file_op = FileOp.new(@engine, self)
  end

  describe "#banner" do
    it "should be instance of Game" do
      expect(@game).to be_instance_of(Game)
    end

    it "should not be nil" do
      expect(game.banner.should) != nil
    end

    it "expect type string" do
      @game.banner.should be_kind_of(String)
    end

    it "not be Fixnum" do
      @game.banner.should_not be_kind_of(Fixnum)
    end
  end

  describe "#setup" do
    it "should not be nil" do
      expect(game.banner.should) != nil
    end
    it "expect type string" do
      @game.banner.should be_kind_of(String)
    end
    it "not be Fixnum" do
      @game.banner.should_not be_kind_of(Fixnum)
    end

    it "setup game for new play" do
      allow(@game).to receive(:words_to_guess).and_return("friend")
      allow(@game).to receive(:scrambled).and_return('______')
      allow(@game).to receive(:lives).and_return(5)
      allow(@game).to receive(:setup).and_return(:lives)
      expect(@game.setup).to eql(:lives)
    end
  end

  describe "#start" do
    it "displays the games first screen" do
      allow(@game).to receive(:banner).and_return(:banner)
      allow(@game).to receive(:start).and_return(:banner)
      expect(@game.start).to eql(:banner)
    end
  end

  describe "#play" do
    it "plays the Game" do
      allow(@game).to receive(:scrambled).and_return("______")
      allow(@game).to receive(:lives).and_return(5)
      allow(@game).to receive(:put).and_return('f')
      allow(@game).to receive(:play).and_return(:scrambled)
      expect(@game.play).to eql(:scrambled)
    end
  end

  describe "#save_or_quit" do
    it "returns a save Hash" do
      expect(@game.save_or_quit).to be_kind_of(Hash)
    end
  end

  describe "#basic_actions" do
    it "returns an Hash of basic allowed actions" do
      expect(@game.basic_actions).to be_kind_of(Hash)
    end
  end

  describe "#save" do
    it "returns an hash of save action" do
      expect(@game.save).to be_kind_of(Hash)
    end
  end

  describe "#decrement_life" do
    it "reduces live by one on wrong guess" do
      allow(@game).to receive(:lives).and_return(5)
      expect(@game.lives).to eql(5)
      end
  end

  describe "#won" do
    it "actions when game is already started" do
    allow(@game).to receive(:won).and_return(true)
    expect(@game.won).to be true
    end
  end

  describe "#save_id" do
    it "request user to enter saved game ID" do
    allow(@game).to receive(:put).and_return(nil)
    allow(@game).to receive(:save_id).and_return(3)
    expect(@game.save_id).to eql(3)
    end
  end

  describe "#load_setup" do
    it "load setup from file" do
    allow(@game).to receive(:load_setup).and_return(3)
    expect(@game.load_setup).to eql(3)
    end
  end

end
