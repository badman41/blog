require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :en
    config.middleware.use I18n::JS::Middleware
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
