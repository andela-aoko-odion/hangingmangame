# HangmanAndrew

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hangman_andrew`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hangman_andrew'

# Hangman

[![Coverage Status](https://cdn.rawgit.com/andela-aoko-odion/hangman/master/coverage/coverage.svg)](https://coveralls.io/github/andela-aoko-odion/hangman?branch=master)

This is a simulation of the classic Hangman Game in Ruby.

## Background

When a player initiates the game
The player is asked if he wants to start
a new game or he wants to play from a
previously saved game.


## example:
	 How would you like to start?
	 (n) or new for new game,
	 (l) or load for load game


If new game is selected, the computer selects a word
and scrambles the word by replace the hidden selected word with ______.

## example:
	 How would you like to start?
         (n) or new for new game,
         (l) or load for load game

	 Have fun guessing what I have in mind: _____.
	 After 5 wrong guesses you have lost the game.
 	 Guess_word : _____

For every turn the player is expected to guess a letter
from the computer guessed word.

     	 Incorrect! guessed  4 guesses left
	  Guess_word : _____
	  e
	  Incorrect! guessed  3 guesses left
 	  Guess_word : _____
	  i
	  Correct! keep guessing
 	  Guess_word : __i__

Each Incorrect guess will reduce the players entitled chance by 1

when the player finally guess the scrambled word he is
greeted with the message

	Correct! keep guessing
	Guess_word : la_yngitis
	r
	Congratulations. You have won

Already started game can also be saved and loaded again later

## Installation


Add this line to your application's Gemfile:


gem 'hangman'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hangman_andrew

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

    $ gem install hangman

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing


Bug reports and pull requests are welcome on GitHub at https://github.com/ande/hangman_andrew.


Bug reports and pull requests are welcome on GitHub at https://github.com/andela-aoko-odion/hangman. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
