require_relative 'spec_helper'

include Hangman

describe Game do
  let(:game) {@game = Game.new}

  before(:each) do
    @game = Game.new
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
  end

  describe "#start" do
    it "should not be nil" do
      expect(game.banner.should) != nil
    end
    #it "expect type string" do
    #{}ave the string" do
    #  @game.save.should include("How would you like to start")
    #end
    it "not be Fixnum" do
      @game.banner.should_not be_kind_of(Fixnum)
    end
  end

  describe "#play" do
    it "should not be nil" do
      expect(@game.play).to not_be nil
    end
    it "expect type string" do
      specify {expect {print "foo"}.to output.to_stdout }
    end
    it "not be Fixnum" do
      @game.play.should_not be_kind_of(Fixnum)
    end
  end

  describe "#basic_actions" do
    it "should not be nil" do
      game = @game.basic_actions
      expect(game.should) != nil
    end
    it "expect type hash" do
        hash = @game.banner
      is_expected.to have_key(:setup)
    end
    it "prints to have key" do
      is_expected.to have_key(:setup)
    end
    it "prints to stdout" do
      specify { @game.basic_actions.should include(:load_setup) }
    end
    it "not be Fixnum" do
      @game.banner.should_not be_kind_of(Fixnum)
    end
  end

  describe "#save_or_quit" do
    it "should not be nil" do
      expect(game.quit.should) != nil
    end
    it "type hash" do
      expect(@game.quit).to be_instance_of(Hash)
      @game.quit.should be_kind_of(Hash)
    end
  end

  describe "#quit" do
    it "should not be nil" do
      expect(game.quit.should) != nil
    end
    it "prints to stdout" do
      should include(:save_to_file)
    end
    it "not be Fixnum" do
      @game.quit.should_not be_kind_of(Fixnum)
    end
  end

  describe "#save" do
    it "should not be nil" do
      expect(game.banner.should) != nil
    end
    it "expect type Hash" do
      @game.save.should include(:save_to_file)
    end
    it "not have :foobar" do
      it should_not include(:foobar)
    end
  end

  describe "#won" do
    it "should not be nil" do
      expect(game.banner.should) != nil
    end
    it "expect type string" do
      @game.banner.should_not be_kind_of(NilClass)
    end
    it "returns true" do
      @game.banner.should be true
    end
  end

  describe "#save_id" do
    it "should not be nil" do
      expect(game.banner.should) != nil
    end
    it "expect type string" do
        g = @game.save_id
      expect(g).to exist
    end
    it "print to stdout" do
      expect(@game.save_id).to output.to_stdout
      @game.banner.should_not be_kind_of(Fixnum)
    end
  end


end
