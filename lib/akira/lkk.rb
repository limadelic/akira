require 'rest-open-uri'
require 'json'

module Akira

  class LKK

    @@def = LKK_SETTINGS
    @@base_url = "http://#{@@def.site}.leankitkanban.com/Kanban/Api/"
    @@board_url = "#{@@base_url}Board/#{@@def.board}/"

    def stories
      cards.collect { |card| story_from card }
    end

    def add(story)
      new_story = {
        :Id => 0,
        :Title => "#{story[:id]} #{story[:title]}",
        :TypeId => @@def.default_card_type,
      }.to_json
      url = "#{@@board_url}AddCard/Lane/#{@@def.first_lane}/Position/0"
      post url, new_story
    end

    private

    def board
      request "#{@@base_url}/Boards/#{@@def.board}"
    end

    def cards
      board['Lanes'].inject(Array.new) do |stories, lane|
        stories + lane['Cards']
      end
    end

    def story_from(card)
      title_tokens = card['Title'].split ' ', 2
      { :id => title_tokens[0], :title => title_tokens[1] }
    end

    def request(url)
      response = open url, :http_basic_authentication => [@@def.user, @@def.pass]
      JSON.parse(response.read)['ReplyData'][0]
    end

    def post(url, body)
      response = open(
        url,
        :method => :post,
        :http_basic_authentication => [@@def.user, @@def.pass],
        :body => body,
        'content-type' => 'application/json'
      )
      jj JSON.parse(response.read)
    end

  end

end