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

end