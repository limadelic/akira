Feature: akira reads jira task board

  In order to check for new stories
  Akira will read them from jira task board

  Scenario: read stories
    When akira reads jira task board
    Then it should contain the stories