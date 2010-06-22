module Akira

  class Akira

    def new_stories
      jiras - lkkards
    end

    def jiras
      Jira.new.stories
    end

    def lkkards
      LKK.new.stories
    end

  end

end