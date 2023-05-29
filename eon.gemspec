# frozen_string_literal: true

require_relative "lib/eon/version"

Gem::Specification.new do |spec|
  spec.name = "eon_crypt"
  spec.version = Eon::VERSION
  spec.authors = ["Travis Fantina"]
  spec.email = ["travis@objective.dev"]

  spec.summary = "Tool for encrypting and decrpyting .env files"
  spec.description = "Pass around AES keys then check .env.encrypted into your repo"
  spec.homepage = "https://github.com/tfantina/eon"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = ["bin/eon", "lib/eon/eon.rb", "lib/eon/version.rb", "lib/eon.rb"]
  # Dir.chdir(__dir__) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci
  #                                                            appveyor]) || (f.include?("eon") && !f.include?("lib/eon"))
  #   end
  # end
  spec.bindir = "bin"
  spec.executables = ["eon"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_runtime_dependency "thor", "~> 1.2.2"
end
