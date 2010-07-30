
describe "when deleting a story" do

  it "should remove the matching cards" do
    match = { 'Title' => '42 match'}
    dud = { 'Title' => '13 dud'}
    cards = [ dud, match, dud ]

    @lkk = Akira::LKK.new

#    mock(@lkk).cards { cards }

    @lkk.delete dud

    cards.should == [dud, dud]
  end
end