# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.2.2"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"

# Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
gem "rubocop", require: false

# Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure.
gem "awesome_print", require: "ap"

# Autoload dotenv in Rails.
gem "dotenv-rails", "~> 2.1", ">= 2.1.1"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.5"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use ActiveStorage variant
# gem "mini_magick", "~> 4.8"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Polist::Service is a simple class designed for creating service classes
gem "polist"

# Tainbox is a utility gem that can be used to inject attributes into Ruby objects
gem "tainbox"

# File.foreach("path/to/file") { |line|  }
gem "sequel"
gem "sequel-rails"
#gem 'sequel_pg', :require=>'sequel'

group :development, :test do
  # Code stylies by Umbrellio
  gem "rubocop-config-umbrellio"
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  # Test data
  gem "faker"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
