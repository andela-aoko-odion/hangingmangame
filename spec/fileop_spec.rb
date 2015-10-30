require_relative "spec_helper"

include Hangman

describe FileOp do
 let(:file_op ) { Class.new.extend(Mastermind::FileOp)}
  before :each  do
  end

  describe "#save_to_file" do
    it "saves players session to file" do
      allow(file_op).to receive(open).and_return("helloword")
      allow(file_op).to receive(puts).and_return("helloworldman")
      #expect
    end
  end

  describe "#load_game" do
    it "should return" do
      allow(file_op).to receive(get_session_id).and_return(2)
      allow(file_op).to receive(load_file).and_return("helloworldman")
      expect(file_op.load_game).to eql("helloworldman")
    end
  end

  describe "#get_session_id" do
    it "gets a player id to restart a save game" do
      allow(file_op).to receive(:get).and_return(2)
      expect(file_op.get_session_id).to eql(2)
    end
  end

  describe "#restart_session" do
    it "loads a previously saved game" do
      allow(file_op).to receive(load_file).and_return({"helloworldman")
      allow(file_op).to receive(JSON.parse).and_return("helloworldman")
      #expect(@file_op.restart_session).to eql()
    end
  end

  describe "#show_saved_sessions" do
    it "show saved games" do
      allow(file_op).to receive(readlines).and_return("helloworld")
      allow(file_op).to receive(parse).and_return("helloworldman")
      #expect()
    end
  end

  describe "#load_file" do
    it "loads a specific saved session from file" do
      allow(file_op).to receive(readlines).and_return("hellowordman")
      #expect
    end
  end

  describe "#get_player_name" do
    it "prompts for player to enter their name" do
      allow(file_op).to receive(:put).and_return("Enter player name")
      allow(file_op).to receive(:get).and_return("helloworldman")
      #expect
    end
  end

end
