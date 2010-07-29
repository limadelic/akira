Feature: akira adds jira stories to lkk

  In order avoid duplicated efforts/errors using lkk/jira
  I want to have new jiras added to lkk

  Scenario: read stories from jira's task board
    When jira task board is read
    Then it should contain jira stories

  Scenario: find new stories
    When new stories appear in jira
    Then they should detected

  @delete_cards
  Scenario: add new story to lkk
    When a new story is added to lkk
    Then it should contain the story
    
  Scenario: add new stories to lkk
    When stories are added to lkk
    Then they should appear on lkk board