require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "When reading jira task board" do

  it "should load the stories" do
    @jira = Akira::Jira.new
    @jira.stories.should_not be_empty
  end
end