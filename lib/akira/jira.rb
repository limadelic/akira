require 'jira4r'

module Akira

  class Jira

    @@def = JIRA_SETTINGS

    def initialize
      @jira = Jira4R::JiraTool.new 2, @@def.server
      @jira.login @@def.user, @@def.pass
    end

    def stories
      issues.collect { |issue| Story.from_issue issue }
    end

    private

    def issues
      @jira.getIssuesFromFilter @@def.task_board_filter
    end

  end

end