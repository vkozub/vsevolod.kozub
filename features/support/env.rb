require 'capybara/cucumber'
require 'selenium-webdriver'
# require 'site_prism'
# require 'require_all'

# require_all 'page_objects'
# require_relative '../../modules/feature_helper'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, { browser: :chrome, options: options } )
end

# World(FeatureHelper)