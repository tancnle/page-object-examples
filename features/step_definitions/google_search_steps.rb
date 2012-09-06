Given /^I am on Google search page$/ do
  visit_page GoogleSearchPage
end

When /^I search for "([^\"]*)"$/ do |search_query|
  on_page GoogleSearchPage do |page|
    page.search_for search_query
  end
end

Then /^I should see "([^\"]*)" in the search results$/ do |search_result|
  on_page GoogleSearchPage do |page|
    page.search_results.should include(search_result)
  end
end
