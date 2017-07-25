# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "huyettings"

Gem::Specification.new do |spec|
  spec.name          = "huyettings"
  spec.version       = Huyettings::VERSION
  spec.authors       = ["Yana Petrova"]
  spec.email         = ["janavpetrova@gmail.com"]

  spec.summary       = %q{Supersimple configuration manager.}
  spec.description   = %q{Single level. ERB. YML. No more pain.}

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
