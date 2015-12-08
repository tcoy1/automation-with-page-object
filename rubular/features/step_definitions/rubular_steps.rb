require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


# When I enter the regexp (.*)@(.*)\.(.*)
When /^I enter the regexp \(\.\*\)@\(\.\*\)\\\.\(\.\*\) and test string jden@cscc\.edu$/ do
  visit_page(RubularSearch) do |page|
    page.search_for '(.*)@(.*)\.(.*)'
    page.test_with 'jden@cscc.edu'
    sleep 2
  end
end

Then /^it returns a match result of jden@cscc.edu$/ do
  on_page(RubularResults) do |page|
	  expect(page.get_match_results).to eq("jden@cscc.edu")
	end
end

Then /^it returns three match groups which are jdenen, cscc, and edu$/ do
  on_page(RubularResults) do |page|
    expect(page.get_match_groups 1, "group").to eq("jden")
    expect(page.get_match_groups 2, 'group').to eq("cscc")
    expect(page.get_match_groups 3, 'group').to eq("edu")
  end
end

Then /^the match groups are each formatted on a new line and preceded by a number$/ do
  on_page(RubularResults) do |page|
    expect(page.get_match_groups 1, 'num').to eq("1.")
    expect(page.get_match_groups 2, 'num').to eq("2.")
    expect(page.get_match_groups 3, 'num').to eq("3.")
  end
# because each is in a new row of the table, they are each on a new line
end