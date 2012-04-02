Gem::Specification.new do |s|
  s.name        = 'rsubhak'
  s.version     = '0.1.0'

  s.summary     = "Recursively walk a hash or array (ha), searching for all occurrences of hash key (k), and substituting (within their values) all occurrences of pattern (p) for replacement (r)."
  s.description = "Rsubhak can be used to sanitize a params hash. For instance, remove currency symbols and commas from decimal fields (e.g. price, cost, quantity). Convert '$1,500.00' to '1500.00'."

  s.authors     = ['Alex Batko']
  s.email       = ['alexbatko@gmail.com']

  s.homepage    = 'https://github.com/abatko/rsubhak'

  s.files       = ['lib/rsubhak.rb']
  s.test_files  = Dir["test/**/*"]
end
