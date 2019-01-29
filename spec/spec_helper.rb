require 'rubygems'
require 'bundler'

Bundler.require :default, :development, :test

# Combustion initialization has to happen before loading rspec/rails
#Combustion.initialize! :sequel_rails

require 'rspec/rails'
#require 'ammeter/init'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  #config.filter_run_excluding rspec_exclusions

  config.include RspecSequel::Matchers

  config.before(:all) do

    I18n.backend.store_translations(
      :en,
      'sequel' => {
        'models' => {
          'user' => 'translated user'
        }
      }
    )
  end

  config.around :each do |example|

    if example.metadata[:no_transaction]
      example.run
    else
      Sequel::Model.db.transaction(:rollback => :always) do
        example.run
      end
    end
  end

  [:expect_with, :mock_with].each do |method|
    config.send(method, :rspec) do |c|
      c.syntax = :expect
    end
  end
end
