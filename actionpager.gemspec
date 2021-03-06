
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
version = File.read(File.expand_path("VERSION", __dir__)).strip
date = File.read(File.expand_path("RELEASE_DATE", __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = "actionpager"
  spec.version       = version
  spec.date          = date
  spec.authors       = ["Ryo Hashimoto"]
  spec.email         = ["ryohashimoto@gmail.com"]

  spec.summary       = "Simple and lightweight paginator"
  spec.description   = "Simple and lightweight paginator for collections (Array, ActiveRecord::Relation etc.)"
  spec.homepage      = "https://github.com/ryohashimoto/actionpager"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "activerecord", ">= 5.2"
  spec.add_development_dependency "sqlite3", "~> 1.4"
end
