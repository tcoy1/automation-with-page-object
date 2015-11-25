Feature: As a student I want to find
	the special topics course so that
	can learn cucmber

	Scenario: A search for CSCI 2994 from the homepage of
		CSCC yields more than one result
		When I search for CSCI 2994
		Then the search yields more than one result
		Then the first result is "CSCI-2994 - CSCI Current Topics"
		
	Scenario: The course CSCI 2994 list none as its prerequisites
		When I look at the course CSCI 2994
		Then the course listing has None for its prerequisites
		Then I can open the bookstore site to the required text book