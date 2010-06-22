Feature: akira adds jira stories to lkk

  In order avoid duplicated efforts/errors using lkk/jira
  I want to have new jiras added to lkk

  Scenario: read stories from jira's task board
    When jira task board is read
    Then it should contain jira stories

  Scenario: read stories from lkk board
    When lkk board is read
    Then it should contain lkk stories

  Scenario: find new stories
    When new stories appear in jira
    Then they should detected