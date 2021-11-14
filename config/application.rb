# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Chown
  class Application < Rails::Application
    config.load_defaults 6.1

    # Autoload locales from subdirectories under config/locales.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{yml,rb}')]

    # config.autoload_paths << 'app/models'

    # Customize the generators
    config.generators do |g|
      g.system_tests = nil
      g.stylesheets false
      g.helper false
      g.assets false
      g.javascript_driver false
      g.test_framework false

      # Use UUIDs as primary key for all ActiveRecord models.
      g.orm :active_record, primary_key_type: :uuid
      g.orm :active_record, foreign_key_type: :uuid
    end

    # Set Portuguese as default locale.
    config.i18n.default_locale = :'pt-BR'

    # Configure devise layout
    config.to_prepare do
      Devise::SessionsController.layout 'home'
      Devise::ConfirmationsController.layout 'home'
      Devise::UnlocksController.layout 'home'
      Devise::PasswordsController.layout 'home'
    end
  end
end
