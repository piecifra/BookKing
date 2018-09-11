Feature: ProposedBook
	Given a ProposedBook exists called "Libro"
	When I visit the list
	Then I should see a proposebook called "Libro"
	I authenticate as the user "joe" with the password "god"

	Scenario: Create ProposedBook
		Given a valid user with email "admin@admin.it" username "admin" and password "adminadmin"
    	When I go to the login page
    	And I sign in with email "admin@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
    	Given a ProposedBook exists called "Libro" with isbn "1234567890" from user with 1 as id
    	When I visit my list
    	Then I should see a ProposeBook called "Libro"

	Scenario: Create ProposedBook
		Given a valid user with email "admin@admin.it" username "admin" and password "adminadmin"
    	When I go to the login page
    	And I sign in with email "admin@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
    	Given a ProposedBook exists called "Libro" with isbn "1234567890" from user with 1 as id
    	When I visit my list
    	Then I should see a ProposeBook called "1234567890"