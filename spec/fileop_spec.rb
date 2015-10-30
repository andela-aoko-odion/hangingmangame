require_relative "spec_helper"

include Hangman

describe FileOp do
 let(:file_op ) {Hangman::FileOp.new}
  before :each  do
  end

  describe "#load_game" do
    it "should return" do
      allow(file_op).to receive(:gets).and_return("1")
      allow(file_op).to receive(:load_file).and_return("helloworldman")
      expect(file_op.load_game).to eql("helloworldman")
    end
  end

  describe "#save_file" do
    it "saves players session to file" do
      allow(file_op).to receive(:puts).and_return("helloword")
      expect(file_op.save_file("data.json", "helloword")).to be nil
    end
  end


  describe "#write_data" do
    it "write data to file" do
    allow(file_op).to receive(:open).and_return(true)
    allow(file_op).to receive(:write).and_return(true)
    expect(file_op.write_data("helloworld")).to eql(true)
    end
  end

  describe "#get_player_name" do
    it "prompts for player to enter their username" do
      allow(file_op).to receive(:put).and_return("username")
      allow(file_op).to receive(:gets).and_return("helloworld")
      expect(file_op.get_player_name).to eql("helloworld")
    end
    it "returns invalid for non alphabets" do
      allow(file_op).to receive(:put).and_return("username")
      allow(file_op).to receive(:gets).and_return("helloworld")
      expect(file_op.get_player_name).to eql(file_op.get_player_name)
    end
  end

end
