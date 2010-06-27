module Akira

  class Story

    @@def = STORY_SETTINGS
    
    def self.from_card(card)
      title_tokens = card['Title'].split ' ', 2
      {
        :id => title_tokens[0],
        :title => title_tokens[1][0..@@def.max_title_length - 1]
      }
    end

    def self.from_issue(issue)
      {
        :id => issue.key,
        :title => issue.summary[0..@@def.max_title_length - 1]
      }
    end

  end

end
