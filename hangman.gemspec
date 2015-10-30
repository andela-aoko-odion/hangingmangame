# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hangman/version'

Gem::Specification.new do |spec|
  spec.name          = "hangman_game1"
  spec.version       =  Hangman::VERSION
  spec.authors       = ["andrew oko-odion"]
  spec.email         = ["mrniceguy4net@yahoo.com"]

  spec.summary       = %q{Hangman, a game that allows its player to guess a word by guessing each letter per turn.}
  spec.description   = %q{Hangman . You will be told if your  guess was correct or not for each guess till the game is won by the player or lives is equal to zero. Enjoy! :)}
  spec.homepage      = "https://rubygems.org/gems/hangman"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "lib " #"exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "rake"
  spec.add_dependency "rspec"
  spec.add_dependency "colorize"
  spec.add_dependency "json"
end
