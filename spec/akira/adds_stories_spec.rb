require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "when searching new stories" do

  it "should find the jiras missing in lkk" do

    @akira = Akira::Akira.new

    mock(@akira).jiras { [ 'new story', 'old story' ] }
    mock(@akira).lkkards { [ 'old story' ] }

    new_stories = @akira.new_stories

    new_stories.count.should == 1
    new_stories.first.should == 'new story'
  end

  it "should convert lkk cards to stories" do

    @lkk = Akira::LKK.new
                                  
    mock(@lkk).cards {[{ 'Title' => '42 story title'}]}

    @lkk.stories.should == [{ :id => '42', :title => 'story title'}]
  end

  it "should constrain title length" do
    STORY_SETTINGS.max_title_length = 5

    card = { 'Title' => '42 story title'}
    Akira::Story.from_card(card)[:title].should == "story"

    jira = Jira4R::V2::RemoteIssue.new
    jira.summary = 'story title'
    Akira::Story.from_issue(jira)[:title].should == "story"
  end

end