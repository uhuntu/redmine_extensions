#$:.push File.expand_path("../lib", __FILE__)

require_relative "lib/tes_redmine_extensions/version"

Gem::Specification.new do |spec|
  spec.name        = "tes_redmine_extensions"
  spec.version     = TesRedmineExtensions::VERSION
  spec.authors     = ["Easy Software Ltd and TES"]
  spec.email       = ["hunt.lin@tes-tec.com"]
  spec.homepage    = "https://www.tes-tec.com/"
  spec.summary     = "TES Redmine Extensions is set of usefull features for Redmine. Main focus is on development helpers, but many users can find it helpfull"
  spec.description = "TES Redmine Extensions provide many extended functionalities for Redmine project."
  spec.license     = 'GPL-2.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://uhuntu.net/"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://uhuntu.net/"
  spec.metadata["changelog_uri"] = "https://uhuntu.net/"

  spec.test_files = Dir["spec/**/*"]

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "GPL-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 4.2", "< 7.2"
  spec.required_ruby_version = '>= 2.5'
end
