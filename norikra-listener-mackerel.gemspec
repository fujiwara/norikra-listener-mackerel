# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "norikra-listener-mackerel"
  spec.version       = "0.1.0"
  spec.authors       = ["FUJIWARA Shunichiro"]
  spec.email         = ["fujiwara.shunichiro@gmail.com"]

  spec.summary       = "Norikra listener plugin to post service metrics for Mackerel."
  spec.description   = "Norikra listener plugin to post service metrics for Mackerel."
  spec.homepage      = "https://github.com/fujiwara/norikra-listener-mackerel"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.platform      = "java"
  spec.license       = "GPLv2"

  spec.add_runtime_dependency "norikra"
  spec.add_runtime_dependency "mackerel-client"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
