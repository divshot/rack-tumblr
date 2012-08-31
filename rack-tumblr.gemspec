# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/tumblr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Bleigh"]
  gem.email         = ["mbleigh@mbleigh.com"]
  gem.description   = %q{A middleware to mount Tumblr blogs into a Rack application.}
  gem.summary       = %q{A middleware to mount Tumblr blogs into a Rack application.}
  gem.homepage      = "https://github.com/divshot/rack-tumblr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-tumblr"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Tumblr::VERSION

  gem.add_runtime_dependency "rack-reverse-proxy"
  gem.add_development_dependency "rspec"
end
