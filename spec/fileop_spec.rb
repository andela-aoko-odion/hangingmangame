require_relative "spec_helper"

describe Hangman::FileOp do

  before :each  do
    @file_op = Hangman::FileOp.new
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@file_op).to be_a Hangman::FileOp
    end
  end

  describe "#greeting" do
    it "returns greetings " do
      expect(@file_op.greeting).to include("HANGMAN")
      expect(@file_op.greeting).to be_a String
    end
  end

  describe "#difficulty" do
    it "returns the difficulty level choosen " do
      expect(@file_op.difficulty).to include("Choose a difficulty level.")
      expect(@file_op.difficulty).to be_a String
    end
  end

  describe "#invalid_entry" do
    it "returns nil " do
      expect(@file_op.invalid_entry).to include("Invalid entry.")
      expect(@file_op.invalid_entry).to be_a String
    end
  end

  describe "#get_name" do
    it "returns string" do
      expect(@file_op.get_name).to include("Please enter a username")
      expect(@file_op.get_name).to be_a String
    end
  end

  describe "#complete_file_op" do
    it "returns winner info" do
      expect(@file_op.complete_file_op).to include("YOU HANGED HANGMAN!")
      expect(@file_op.complete_file_op).to be_a String
    end
  end

  describe "#lost" do
    it "returns loser info" do
      expect(@file_op.lost("word")).to include("YOU HAVE BEEN HANGED!")
      expect(@file_op.lost("word")).to be_a String
    end
  end

  describe "#msg" do
    it "returns any message passsed to it" do
      expect(@file_op.msg("word")).to include("word")
      expect(@file_op.msg("word")).to be_a String
    end
  end

  describe "#confirm_quit" do
    it "returns any message passsed to it" do
      expect(Hangman::FileOp::confirm_quit).to include("Press Y to confirm")
      expect(Hangman::FileOp::confirm_quit).to be_a String
    end
  end

  describe "#quit_notice" do
    it "returns any message passsed to it" do
      expect(Hangman::FileOp::quit_notice).to include("successfully ended")
      expect(Hangman::FileOp::quit_notice).to be_a String
    end
  end

  describe "#save_notice" do
    it "returns any message passsed to it" do
      expect(Hangman::FileOp::save_notice).to include("Press Y to confirm")
      expect(Hangman::FileOp::save_notice).to be_a String
    end
  end

  describe "#no_source" do
    it "returns any message passsed to it" do
      expect(Hangman::FileOp::no_source).to include("No file")
      expect(Hangman::FileOp::no_source).to be_a String
    end
  end


end
