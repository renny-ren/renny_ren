require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative "../app/middlewares/handle_bad_encoding_middleware.rb"

module Renny
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.exceptions_app = self.routes
    config.time_zone = "Beijing"

    config.middleware.insert 0, Rack::UTF8Sanitizer
    config.middleware.insert_before Rack::Runtime, HandleBadEncodingMiddleware
  end
end
