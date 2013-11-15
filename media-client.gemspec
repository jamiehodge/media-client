$:.unshift File.expand_path("../lib", __FILE__)
require "media/client/version"

Gem::Specification.new do |gem|
	gem.name        = "media-client"
	gem.version     = Media::Client::VERSION
	gem.authors     = ["Jamie Hodge"]
	gem.email       = ["jamieh@hum.ku.dk"]
	gem.summary     = ""
	gem.description = gem.summary
	gem.homepage    = ""

	gem.files         = `git ls-files`.split($/)
	gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
	gem.require_paths = ["lib"]

  gem.add_dependency "faraday"
  gem.add_dependency "yajl-ruby"
end
