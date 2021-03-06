include Matchers

When /^jira task board is read$/ do
  @jira = Akira::Jira.new
end

Then /^it should contain jira stories$/ do
  @jira.stories.should_not be_empty
end

When /^new stories appear in jira$/ do
  @akira = Akira::Akira.new
end

Then /^they should detected$/ do
  @akira.new_stories.should_not be_empty
end

When /^a new story is added to lkk$/ do
  @new_story = { :id => '42', :title => 'new story' }

  @lkk = Akira::LKK.new
  @lkk.add @new_story
end

Then /^it should contain the story$/ do
  @lkk.stories.should include @new_story
end

When /^stories are added to lkk$/ do
  @akira = Akira::Akira.new
  @lkk = Akira::LKK.new

  @new_stories = @akira.new_stories
  @akira.add_new_stories
end

Then /^they should appear on lkk board$/ do
  @akira.new_stories.should be_empty
  @lkk.stories.should contain @new_stories
end
