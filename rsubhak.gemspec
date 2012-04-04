Gem::Specification.new do |s|
  s.name        = 'rsubhak'
  s.version     = '0.1.3'

  s.summary     = "Recursively traverse a hash or array (ha), searching for all occurrences of hash key (k), and substituting (within their values) all occurrences of pattern (p) for replacement (r)."
  s.description = "#{s.summary}. Though the initial intent was to sanitize the params hash as far as removing currency symbols and/or commas from attributes such as price and quantity, there is a better approach: see the note on the homepage."

  s.authors     = ['Alex Batko']
  s.email       = ['alexbatko@gmail.com']

  s.homepage    = 'https://github.com/abatko/rsubhak'

  s.files       = ['lib/rsubhak.rb']
  s.test_files  = Dir["test/**/*"]
end
