require 'capybara/cucumber'
require 'json'
require 'pry'
require 'require_all'
require 'selenium-webdriver'
require 'site_prism'



require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_relative 'feature_helper'
require_relative 'api_helper'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, { browser: :chrome, options: options } )
end

World(FeatureHelper, APIHelper)