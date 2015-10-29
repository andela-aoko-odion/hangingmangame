require_relative 'spec_helper'
describe Hangman do
  it 'has a version number' do
    expect(Hangman::VERSION).not_to be nil
  end

  it 'has class Engine' do
    expect(Hangman::Engine).not_to be nil
  end

  it 'has class FileOp' do
    expect(Hangman::FileOp).not_to be nil
  end

  it 'has class Game' do
    expect(Hangman::Game).not_to be nil
  end

end
