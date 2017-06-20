require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Airport
  class Application < Rails::Application
    config.autoload_paths += %W[#{config.root}/lib]
    config.autoload_paths += %W[#{config.root}/lib/services]

    config.i18n.default_locale = :ru
    config.i18n.fallbacks = [:en]

    config.active_record.raise_in_transactional_callbacks = true
  end
end
