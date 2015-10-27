

include hangman

describe Game do

  before(each:) do
    @game = Game.new
  end
# describe "#initialize" do
#   it "initializes the game class" do
#     #expect
#   end
# end

describe "#start" do
  it "should start the game" do
    allow(@game).to receive(:confirm).and_return("Started")
    expect(@game.start).to eq("Started")
  end
end

describe "#start" do
  it "should start the game" do
    allow(@game).to receive(put:).and_return("Started")
    #allow(@game).to receive()
    expect(@game.start).to eq("Started")
  end
end

describe "#invalid" do
  it "should to report invalid input" do
    allow(@game).to receive(put:).and_return("bad")
    allow(@game).to receive(:confirm).and_return("Started")
    expect(@game.invalid).to eq("Started")
  end
end

describe "#invalid" do
  it "should to report invalid input" do
    allow(@game).to receive(find_index).and_return("bad")
    allow(@game).to receive(:confirm).and_return("Started")
    expect(@game.play_new).to eq("Started")
  end
end

end
