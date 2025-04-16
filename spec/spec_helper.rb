# custom spec helper, because I created gem with test/dummy folder,
# and then switched to spec/dummy folder

require "simplecov"
require "rails"

SimpleCov.start("rails")

require_relative "dummy/config/application.rb"
require "active_support/all"
require "simplecov"
