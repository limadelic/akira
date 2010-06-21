Feature: akira adds jira stories to lkk

  In order avoid duplicated efforts/errors using lkk/jira
  I want akira to add jiras to lkk

  Scenario: read stories from jira's task board
    When akira reads jira task board
    Then it should load jira stories

  Scenario: read stories from lkk board
    When akira reads lkk board
    Then it should load lkk stories