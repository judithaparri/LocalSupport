Feature: Site admins can proposed edits to organisations non public fields
As a site admin of HCN
So I can help the superadmin improve the accuracy of HCN
I want to be able to propose edits to inaccurate organisation listings, including to non published fields

 Background: organisations have been added to database
    Given the following organisations exist:
      | name              | description             | address        | postcode | telephone | website             | email                  | publish_email | publish_address | donation_info  |
      | Friendly          | Bereavement Counselling | 34 pinner road | HA1 4HZ  | 020800000 | http://friendly.org | superadmin@friendly.xx | false         |  false          | www.donate.com |

    Given the following users are registered:
      | email                 | password | organisation        | confirmed_at         | superadmin | siteadmin |
      | siteadmin@example.com | pppppppp |                     | 2007-01-01  10:00:00 | false      | true      |

 Scenario: Site admin proposes edit to non public fields
   Given I am signed in as a siteadmin
   And I visit the show page for the organisation named "Friendly"
   And I click "Propose an edit"
   And the telephone field of the proposed edit should be pre-populated with the telephone of the organisation named "Friendly"
   And the email field of the proposed edit should be pre-populated with the email of the organisation named "Friendly"
   And the address field of the proposed edit should be pre-populated with the address of the organisation named "Friendly"
   When I propose the following edit:
     | telephone  | address         | email    |
     | 520800000  | 30 pinner road  | a@a.com  |
   And I press "Propose this edit"
   Then "Friendly" should have the following proposed edits by user "siteadmin@example.com":
     | telephone  | address         | email    |
     | 520800000  | 30 pinner road  | a@a.com  |
   Then I should be on the show organisation proposed edit page for the organisation named "Really Friendly"


   
   
   



