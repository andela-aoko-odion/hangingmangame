<<<<<<< HEAD
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hangman_andrew'
=======
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
>>>>>>> 09ecf2f140b57f7a04081e7c2d687368b4257b5e
