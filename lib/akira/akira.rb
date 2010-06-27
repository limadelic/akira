module Akira

  class Akira

    def initialize
      @jira = Jira.new
      @lkk = LKK.new
    end

    def add_new_stories
      new_stories.each { |story| @lkk.add story }
    end

    def new_stories
      jiras - lkkards
    end

    def jiras
      @jira.stories
    end

    def lkkards
      @lkk.stories
    end

  end

end