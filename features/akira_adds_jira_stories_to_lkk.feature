Feature: akira adds jira stories to lkk

  In order avoid duplicated efforts/errors using lkk/jira
  I want akira to add jiras to lkk

  Scenario: read stories from task board
    When akira reads jira task board
    Then it should load the stories