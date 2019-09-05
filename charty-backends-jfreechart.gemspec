lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "charty/backends/jfreechart/version"

Gem::Specification.new do |spec|
  spec.name          = "charty-backends-jfreechart"
  spec.version       = Charty::Backends::Jfreechart::VERSION
  spec.authors       = ["284km"]
  spec.email         = ["k.furuhashi10@gmail.com"]

  spec.summary       = %q{Charty JFreeChart backend adapter}
  spec.description   = %q{Charty JFreeChart backend adapter}
  spec.homepage      = "https://github.com/284km/charty-backends-jfreechart"
  spec.license       = "MIT"

  spec.platform = "java"
  spec.requirements << "jar org.jfree:jfreechart, 1.0.19"
  spec.add_runtime_dependency 'jar-dependencies'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/284km/charty-backends-jfreechart"
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "charty"
  spec.add_dependency "fileutils"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
