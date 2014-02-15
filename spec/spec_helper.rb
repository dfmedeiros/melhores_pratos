ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before(:each) { GC.disable }
  config.after(:each) { GC.enable }
end
