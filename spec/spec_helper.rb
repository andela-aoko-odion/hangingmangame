#require 'coveralls'
#Coveralls.wear!
require 'simplecov'

SimpleCov.start

require "rspec"
require_relative '../lib/engine'
require_relative '../lib/fileop'
require_relative '../lib/hangman'
require_relative '../lib/game'
require "simplecov-shield"
SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter
#SimpleCov.start
