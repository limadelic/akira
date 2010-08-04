require 'rest-open-uri'
require 'json'

class LKK
  attr_reader :phases

  def initialize(site, board, user, pass)
    @site, @board, @user, @pass = site, board, user, pass
    @base_url = "http://#{@site}.leankitkanban.com/Kanban/Api/"
    @board_url = "#{@base_url}Board/#{@board}/"
    @board_identifiers = load_board_identifiers
  end

  def doing
    [ Story.new ]
  end

  def phases
    @board_identifiers['Lanes'].collect { |lane| lane['Name'] }
  end

  def board_data
#    jj request("#{@base_url}/Boards/#{@board}")#['Version']#[0]['Cards']
    jj @board_identifiers
  end

  def move(story, phase)
    doing = 13046928
    url = "#{@board_url}MoveCard/13048635/Lane/#{doing}/Position/0"
    post url, ''
  end

  def add(title)
    todo = 13046926
    new_story = {
      :Id => 0,
      :Title => 'Http GET',
      :TypeId => 6674,
    }.to_json
    url = "#{@board_url}AddCard/Lane/#{todo}/Position/0"
    post url, new_story
  end

private

  def load_board_identifiers
    request "#{@board_url}GetBoardIdentifiers"
  end

  def request(url)
    response = open url, :http_basic_authentication => [@user, @pass]
    JSON.parse(response.read)['ReplyData'][0]
  end

  def post(url, body)
    response = open(
      url,
      :method => :post,
      :http_basic_authentication => [@user, @pass],
      :body => body,
      'content-type' => 'application/json'
    )
    JSON.parse(response.read)
  end
end

