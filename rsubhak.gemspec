lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rsubhak/version'

Gem::Specification.new do |s|
  s.name        = 'rsubhak'
  s.version     = Rsubhak::VERSION

  s.summary     = "Recursively traverse a hash or array *ha* (potentially of other nested hashes and/or arrays), doing manipulations. Two methods are available: rsubhak (do substitutions to hash values) and rstrip (strip whitespace from params hash)."
  s.description = "#{s.summary}. Though the initial intent of the rsubhak method was to sanitize the params hash as far as removing currency symbols and/or commas from attributes such as price and quantity, there is a better approach: see the note on the homepage."

  s.authors     = ['Alex Batko']
  s.email       = ['alexbatko@gmail.com']

  s.homepage    = 'https://github.com/abatko/rsubhak'

  s.files       = ['lib/rsubhak.rb']
  s.test_files  = Dir["test/**/*"]
end
