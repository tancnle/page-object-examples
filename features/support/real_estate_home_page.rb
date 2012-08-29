class RealEstateHomePage
  include PageObject

  page_url "http://www.realestate.com.au/buy"

  text_field(:location, :id => "where")

  button(:search_button, :id => "searchBtn")

  def search_using(search_criteria)
    #puts search_criteria
    #require 'ruby-debug'; debugger
    self.location = search_criteria.delete("location") if search_criteria[:location]
    search_criteria.each do |option, value|
      select_refinement option, value
    end
    search_button
    wait_until { self.text.include? "Results for properties for sale" }
  end

  def search_results
    self.div_elements(:class => "vcard").map(&:text)
  end

  private

  REFINEMENT_MAPPINGS = {
    'min_beds'      => {:activator => 'numBeds', :option_selector => "//div[@id='LMIDD_numBeds']//dd[text()='%s']"},
    'property_type' => {:activator => 'propertyType', :option_selector => "//div[@id='LMIDD_propertyType']//label[text()='%s']"},
    'min_price'     => {:activator => 'minPrice', :option_selector => "//div[@id='LMIDD_minPrice']//dd[text()='%s']"},
    'max_price'     => {:activator => 'maxPrice', :option_selector => "//div[@id='LMIDD_maxPrice']//dd[text()='%s']"}
  }

  def select_refinement(option, value)
    self.text_field_element(:id => REFINEMENT_MAPPINGS[option][:activator]).click
    xpath_selector = REFINEMENT_MAPPINGS[option][:option_selector] % value
    self.browser.find_element(:xpath => xpath_selector).click
  end

end
