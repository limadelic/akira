require 'ostruct'
require 'yaml'

settings_file = File.join(File.dirname(__FILE__), 'settings.yml')
settings = YAML.load_file settings_file

STORY_SETTINGS = OpenStruct.new settings['story']
JIRA_SETTINGS = OpenStruct.new settings['jira']
LKK_SETTINGS = OpenStruct.new settings['lkk']