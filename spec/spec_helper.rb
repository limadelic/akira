$: << File.join(File.dirname(__FILE__), "/../lib")

require 'rubygems'
require 'spec'
require 'akira'

Spec::Runner.configure do |config|
  config.mock_with :rr
end