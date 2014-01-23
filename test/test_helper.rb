ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'declarative_authorization/maintenance'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Authorization::TestHelper
  
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  
  def revoke_all_access
    Authorization.current_user = nil
    request.env.delete('REMOTE_ADDR')
    request.session.delete(:auth_via)
    request.session.delete(:user_id)
    CASClient::Frameworks::Rails::Filter.fake(nil)
  end
end
