require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExcelDiff
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.application_name = Rails.application.class.parent_name
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.react.server_renderer_pool_size  ||= 1
    config.react.server_renderer_timeout    ||= 20
    config.react.server_renderer = React::ServerRendering::BundleRenderer
    config.react.server_renderer_options = {
      files: ["server_rendering.js"],
      replay_console: true,
    }
    config.react.server_renderer_extensions = ["jsx", "js"]
    config.react.server_renderer_directories = ["/app/assets/javascripts", "/app/javascripts"]
  end
end
