ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_filter '/config/'

  SimpleCov.command_name "MiniTest #{Time.now}"
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
end if ENV['COVERAGE']

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest-capybara'
require 'capybara/rails'

require 'ci/reporter/rake/minitest_loader' if ENV['GENERATE_REPORTS']

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  extend MiniTest::Spec::DSL
end

class MiniTest::Spec
  class << self
    alias_method :context, :describe
  end

  include ActiveSupport::Testing::SetupAndTeardown
  include ActionController::TestCase::Behavior
  include Devise::TestHelpers
  include Capybara::DSL
  include Capybara::Assertions
  before do
    User.destroy_all
    user = FactoryGirl.create(:test_user)
    sign_in user
    @routes = Rails.application.routes
  end
end
