require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
            
describe "when deleting a story" do

  it "should remove the matching cards" do
    match = { 'Title' => '42 match' }
    dud = { 'Title' => '13 dud' }

    @lkk = Akira::LKK.new

    stub(@lkk).cards { [ dud, match, dud ] }
    stub(@lkk).post

    @lkk.delete Akira::Story.from_card(match)

    @lkk.should have_received.post('deleteUrl', match)
  end
end