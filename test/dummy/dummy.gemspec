require_relative "lib/dummy/version"

Gem::Specification.new do |spec|
  spec.name        = "dummy"
  spec.version     = Dummy::VERSION
  spec.authors     = ["林恒"]
  spec.email       = ["hunt.lin@outlook.com"]
  spec.homepage    = "https://uhuntu.net"
  spec.summary     = "Summary of Dummy."
  spec.description = "Description of Dummy."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://uhuntu.net"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://uhuntu.net"
  spec.metadata["changelog_uri"] = "https://uhuntu.net"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.0.4"
end
