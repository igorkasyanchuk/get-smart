require_relative "lib/get/smart/version"

Gem::Specification.new do |spec|
  spec.name        = "get-smart"
  spec.version     = Get::Smart::VERSION
  spec.authors     = [ "Igor Kasyanchuk" ]
  spec.email       = [ "igorkasyanchuk@gmail.com" ]
  spec.homepage    = "https://github.com/igorkasyanchuk/get-smart"
  spec.summary     = "Learn Ruby and Rails by examples"
  spec.description = "Learn Ruby and Rails by examples"
  spec.license     = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/igorkasyanchuk/get-smart"
  spec.metadata["changelog_uri"] = "https://github.com/igorkasyanchuk/get-smart/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,files}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails"
  spec.add_dependency "tty-markdown"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "wrapped_print"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "ruby-openai"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "colorize"
end
