require "test_helper"
require "capybara"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  
  Capybara.configure do |config|
    config.before(:each, type: :system) do
      driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080],
                           options: { args: %w[headless disable-gpu no-sandbox disable-dev-shm-usage] }
    end
  end
end
