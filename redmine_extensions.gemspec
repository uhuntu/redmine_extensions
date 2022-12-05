require_relative "lib/redmine_extensions/version"

Gem::Specification.new do |spec|
  spec.name        = "redmine_extensions"
  spec.version     = RedmineExtensions::VERSION
  spec.authors     = ["林恒"]
  spec.email       = ["hunt.lin@outlook.com"]
  spec.homepage    = "https://uhuntu.net"
  spec.summary     = "Summary of RedmineExtensions."
  spec.description = "Description of RedmineExtensions."
  spec.license     = "MIT"

  spec.metadata["allowed_push_host"] = "https://uhuntu.net"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://uhuntu.net"
  spec.metadata["changelog_uri"] = "https://uhuntu.net"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.0.4"
end
