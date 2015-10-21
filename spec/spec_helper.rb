#require 'coveralls'
#Coveralls.wear!
require 'simplecov'

SimpleCov.start

require "rspec"
require_relative '../lib/hangman/engine'
require_relative '../lib/hangman/fileop'
require_relative '../lib/hangman'
require_relative '../lib/hangman/game'
#require "simplecov-shield"
#SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter
#SimpleCov.start
