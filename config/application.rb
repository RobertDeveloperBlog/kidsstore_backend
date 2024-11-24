require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KidsstoreBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Добавьте поддержку CORS для обработки запросов с фронтенда
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001'
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head]
      end
    end
  end
end
