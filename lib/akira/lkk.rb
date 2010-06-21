require 'rest-open-uri'
require 'json'

module Akira

  class LKK

    @@def = LKK_SETTINGS
    @@base_url = "http://#{@@def.site}.leankitkanban.com/Kanban/Api/"

    def stories
      board['Lanes'].inject(Array.new) do |stories, lane|
        stories + lane['Cards']
      end
    end

    private

    def board
      request "#{@@base_url}/Boards/#{@@def.board}"
    end

    def request(url)
      response = open url, :http_basic_authentication => [@@def.user, @@def.pass]
      JSON.parse(response.read)['ReplyData'][0]
    end

  end

end