require 'jira4r'

module Akira

  class Jira

    def initialize
      @settings = JIRA_SETTINGS
      @jira = Jira4R::JiraTool.new 2, @settings.server
      @jira.login @settings.user, @settings.pass
    end

    def stories
      [ 42 ]
    end

  end
end