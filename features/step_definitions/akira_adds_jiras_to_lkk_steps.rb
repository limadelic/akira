When /^jira task board is read$/ do
  @jira = Akira::Jira.new
end

Then /^it should contain jira stories$/ do
  @jira.stories.should_not be_empty
end

When /^lkk board is read$/ do
  @lkk = Akira::LKK.new
end

Then /^it should contain lkk stories$/ do
  @lkk.stories.should_not be_empty
end

When /^new stories appear in jira$/ do
  @akira = Akira::Akira.new
end

Then /^they should detected$/ do
  @akira.new_stories.should_not be_empty
end