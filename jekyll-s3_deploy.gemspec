require_relative 'lib/jekyll/s3_deploy/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-s3_deploy"
  spec.version       = Jekyll::S3Deploy::VERSION
  spec.authors       = ["Bodacious"]
  spec.email         = ["bodacious@katanacode.com"]

  spec.summary       = %q{Deploy Jekyll site to Amazon S3 bucket}
  spec.description   = %q{Host your static Jekyll site in an Amazon S3 bucket}
  spec.homepage      = "https://github.com/katanacode/jekyll-s3_deploy"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "dotenv", ">= 2.0.0"
end
