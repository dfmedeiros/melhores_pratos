require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module MelhoresPratos
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = "pt-BR"

    config.time_zone = "Brasilia"

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, request_specs: false
      g.factory_girl true
      g.assets false
    end
  end
end
