RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
end
