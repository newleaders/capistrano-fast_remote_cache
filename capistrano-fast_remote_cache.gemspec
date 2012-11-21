# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano/fast_remote_cache/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Don Morrison"]
  gem.email         = ["dmorrison@newleaders.com"]
  gem.description   = %q{Gem version of the 37 Signals Capistrano Fast Remote Cache (fast_remote_cache) Rails plugin}
  gem.summary       = %q{Gem version of the 37 Signals Capistrano Fast Remote Cache (fast_remote_cache) Rails plugin}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-fast_remote_cache"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::FastRemoteCache::VERSION

  gem.add_dependency "capistrano", ">=2.0.0"
end
