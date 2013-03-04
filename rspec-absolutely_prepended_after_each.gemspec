# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "rspec-absolutely_prepended_after_each"
  gem.version       = File.read(File.join(File.dirname(__FILE__), "VERSION")).chomp
  gem.authors       = ["okitan"]
  gem.email         = ["okitakunio@gmail.com"]
  gem.description   = "absolutely prepended after(:each) in rspec"
  gem.summary       = "absolutely prepended after(:each) in rspec"
  gem.homepage      = "https://github.com/okitan/rspec-absolutely_prepended_after_each"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rspec", "~> 2.0"
end
