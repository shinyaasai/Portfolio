require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module SleepApp
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.time_zone = "Tokyo"
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.action_view.field_error_proc = Proc.new do |html_tag, instance| 
     html_tag
    end
    config.generators do |g| 
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end
