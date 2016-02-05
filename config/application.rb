require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'amazon/ecs'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scrounge
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine      false
      g.test_framework       :rspec, view_specs: false, helper_specs: false, fixture: true
      g.helper               false
      g.stylesheets          false
      g.javascripts          false
    end

     Amazon::Ecs.options = {
      associate_tag:     Settings.aws.associate_tag,
      AWS_access_key_id: Settings.aws.access_key_id,
      AWS_secret_key:    Settings.aws.secret_access_key
    }

    config.active_record.raise_in_transactional_callbacks = true
  end
end
