require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib/hangman', __FILE__)
require 'engine'
require 'fileop'
require 'hangman'
require 'game'
