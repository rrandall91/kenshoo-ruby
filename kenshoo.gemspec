# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kenshoo/version"

Gem::Specification.new do |spec|
  spec.name          = "kenshoo"
  spec.version       = Kenshoo::VERSION
  spec.authors       = ["Rashaad R. Randall"]
  spec.email         = ["rrandall@poweredbyvivid.com"]

  spec.summary       = %q{Ruby wrapper for the Kenshoo REST API}
  spec.description   = %q{Ruby wrapper for the Kenshoo REST API}
  spec.homepage      = "https://github.com/rrandall91/kenshoo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7.0"

  spec.add_runtime_dependency "faraday", "~> 0.13.1"
  spec.add_runtime_dependency "curb", "~> 0.9.4"
  spec.add_runtime_dependency "json", "~> 2.0.4"
end