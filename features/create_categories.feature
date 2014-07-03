Feature: Create categories
  As a blog administrator
  In order to place my blog articles into different categories
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully write articles
    Given I am on the categories page
    When I fill in "category_name" with "Foobar"
    And I fill in "category_keywords" with "Lorem, Ipsum"
    And I fill in "category_description" with "Bob Charlie"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "Foobar"
    And I should see "Lorem, Ipsum"
    And I should see "Bob Charlie"
