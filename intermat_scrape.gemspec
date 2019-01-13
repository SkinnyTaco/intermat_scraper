
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "intermat_scrape/version"

Gem::Specification.new do |spec|
  spec.name          = "intermat-scrape"
  spec.version       = IntermatScrape::VERSION
  spec.authors       = ["Daniel Dawson"]
  spec.email         = ["dannyldawson@gmail.com"]
  spec.summary       = %q{Provides ranking information for the top 20 NCAA wrestlers at each weight.}
  spec.homepage      = "http://rubygems.org/gems/intermat-scrape"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "http://mygemserver.com/api/v1/api_key"
  #
  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "https://github.com/SkinnyTaco/intermat_scraper"
  #   spec.metadata["changelog_uri"] = "https://github.com/SkinnyTaco/intermat_scraper/blob/master/CHANGELOG.md"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ["lib/intermat_scrape/cli.rb","lib/intermat_scrape/version.rb","lib/intermat_scrape/scraper.rb","lib/intermat_scrape/weight_class.rb","lib/intermat_scrape/wrestler.rb","lib/intermat_scrape.rb", "config/environment.rb"]

  spec.bindir        = 'bin'
  spec.executables   << 'intermat-scrape'

  spec.add_development_dependency "nokogiri", "~> 1.10"
  spec.add_development_dependency "colorize", "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "pry", "~>0.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
