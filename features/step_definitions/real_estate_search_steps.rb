Given /^I am on realestate home page$/ do
  visit_page RealEstateHomePage
end

When /^I search properties with the following criteria:$/ do |criteria_table|
  on_page(RealEstateHomePage).search_using criteria_table.rows_hash
end

Then /^I should see some relevant properties$/ do
  on_page RealEstateHomePage do |page|
    page.search_results.should have_at_least(1).item
  end
end
