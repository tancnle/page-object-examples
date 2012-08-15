Given /^I am on Seek home page$/ do
  visit_page SeekHomePage
end

When /^I search with the following criteria:$/ do |criteria_table|
  on_page(SeekHomePage).seek criteria_table.hashes
end

Then /^I should see "([^\"]*)" role in the search results$/ do |search_result|
  on_page SeekHomePage do |page|
    page.search_results.join("|").should match(search_result)
  end
end
