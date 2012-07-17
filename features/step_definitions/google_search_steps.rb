Given /^I am on Google search page$/ do
  visit_page SearchPage
end

When /^I search for "([^\"]*)"$/ do |search_query|
  on_page SearchPage do |page|
    page.search_for search_query
  end
end

Then /^I should see "([^\"]*)" in the search resutls$/ do |search_result|
  on_page SearchPage do |page|
    page.search_results.should include(search_result)
  end
end
