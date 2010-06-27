$: << File.join(File.dirname(__FILE__), "/../lib")

require 'rubygems'
require 'spec'
require 'akira'
require 'matchers'
require 'jira4r'

Spec::Runner.configure do |config|
  config.mock_with :rr
  config.include Matchers
end