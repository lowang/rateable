$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "bundler/setup"
require "minitest/spec"
require "minitest/autorun"
require "mongoid"
require "pry"
require "rateable"

Mongoid.configure do |config|
  config.connect_to "rateable_test"
end
Mongoid.logger = Logger.new($stdout)