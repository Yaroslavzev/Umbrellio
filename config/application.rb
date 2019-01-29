# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Umbrellio
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # This setting disabled the automatic connect after Rails init
    # config.sequel.skip_connect = true

    # Configure if Sequel should try to 'test' the database connection in order
    # to fail early
    config.sequel.test_connect = true

    config.sequel.after_connect = proc do
      Sequel::Model.db.extension :pagination
      # Sequel::Model.db.extension :pg_hstore
      Sequel::DATABASES.first.extension :batches
      Sequel::Model.strict_param_setting = false
      Sequel::Model.plugin :active_model
      Sequel::Model.plugin :validation_helpers
      Sequel::Model.plugin :dirty
      Sequel::Model.plugin :association_proxies
      Sequel::Model.plugin :timestamps, update_on_create: true
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
