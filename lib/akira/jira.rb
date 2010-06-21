require 'jira4r'

module Akira

  class Jira

    @@settings = JIRA_SETTINGS

    def initialize
      @jira = Jira4R::JiraTool.new 2, @@settings.server
      @jira.login @@settings.user, @@settings.pass
    end

    def stories
      @jira.getIssuesFromFilter @@settings.task_board_filter
    end

  end

end