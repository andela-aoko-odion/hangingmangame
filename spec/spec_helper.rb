

#require 'coveralls'
#Coveralls.wear!
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib/hangman_andrew', __FILE__)
require 'engine'
require 'fileop'
require 'hangman_andrew'
require 'game'

#require "simplecov-shield"
#SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter
#SimpleCov.start
