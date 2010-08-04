$: << File.join(File.dirname(__FILE__), "/../lib")

require 'rubygems'
require 'spec'
require 'akira'
require 'matchers'
require 'jira4r'
require 'rr'

Spec::Runner.configure do |config|
  config.mock_with RR::Adapters::Rspec
  config.include Matchers
end