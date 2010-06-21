When /^akira reads jira task board$/ do
  @jira = Akira::Jira.new
end

Then /^it should load jira stories$/ do
  @jira.stories.should_not be_empty
end

When /^akira reads lkk board$/ do
  @lkk = Akira::LKK.new
end

Then /^it should load lkk stories$/ do
  @lkk.stories.should_not be_empty
end
