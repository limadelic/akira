require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "When reading jira task board" do

  before(:all) do
    @jira = Akira::Jira.new
  end

  it "should load the stories" do
    @jira.stories.should_not be_empty
  end
end