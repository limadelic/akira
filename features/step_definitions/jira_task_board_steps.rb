When /^akira reads jira task board$/ do
  @jira = Akira::Jira.new
end

Then /^it should contain the stories$/ do
  @jira.stories.should_not be_empty
end