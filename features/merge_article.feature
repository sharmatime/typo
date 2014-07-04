Feature: Merge Articles
  As a blog administrator
  In order to organize articles discussing the same topic
  I want to be able to merge two articles together

  Background:
    Given the blog is set up
    And the following articles exist
      | title     | body          |
      | Foobar    | Lorem Ipsum   |
      | Rainbows  | Punky Bruster |
    And the following comments exist
      | articleTitle  | comment                      |
      | Foobar        | What does Lorem Ipsum mean?  |
      | Rainbows      | Sunshine!                    |

  Scenario: A non-admin cannot merge two articles
    Given I am on the article page for "Foobar"
    Then I should not see "Article ID"

  Scenario: Allow merge for admin
    And I am logged into the admin panel
    Given I am on the article page for "Foobar"
    Then I should see "Article ID"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    And I am logged into the admin panel
    Given I am on the article page for "Foobar"
    And I fill in "merge_with" with "Rainbows"
    And I press "Merge"
    Then the article "Foobar" should have body "Lorem Ipsum Punky Bruster"
    And the article "Foobar" should have comment "What does Lorem Ipsum mean?"
    And the article "Foobar" should have comment "Sunshine!"