require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


# Hooks
Before do
	@browser = Watir::Browser.new
end
After do
	@browser.close
end


# When I search for CSCI 2994
When /^I search for CSCI 2994$/ do
  visit_page(CourseSearch) do |page|
    page.search_for 'CSCI-2994'
  end
end

Then /^the search yields more than one result$/ do
	on_page(CourseResults) do |page|
	  expect(page.search_result_elements.length).to be > 1
	end
end

Then /^the first result is "CSCI-2994 - CSCI Current Topics"$/ do
  on_page(CourseResults) do |page|
  expect(page.search_result_elements[0].text).to include("CSCI-2994 - CSCI Current Topics")
	end
end


# When I look at the coure CSCI 2994
When /^I look at the course CSCI 2994$/ do
  visit_page(CourseListing)
end

Then /^the course listing has None for its prerequisites$/ do
  on_page(CourseListing) do |page|
    expect(page.check_prereqs).to eq("None")
  end
end

Then /^I can open the bookstore site to the required text book$/ do
  on_page(CourseListing) do |page|
    page.bookstore_link
    sleep 5
    @browser.windows.last.use
   expect(@browser.url).to eq("http://www.bkstr.com/columbusstateccstore/home/en?cm_mmc=Redirect-_-VanityURL-_-cscc.bkstr.com-_-14803")
  end
end
