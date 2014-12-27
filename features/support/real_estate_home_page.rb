class RealEstateHomePage
  include PageObject

  page_url "http://www.realestate.com.au/buy"

  text_field(:location, :id => "where")

  button(:search_button, :class => "rui-search-button")

  def search_using(search_criteria)
    self.location = search_criteria.delete("location") if search_criteria[:location]
    search_criteria.each do |option, value|
      select_refinement option, value
    end
    search_button
    wait_until { self.text.include? "Results for properties for sale" }
  end

  private

  REFINEMENT_MAPPINGS = {
    'min_beds'      => {:activator => '.min.beds.select-holder input', :option_selector => ".min.beds li[data-value='%s']"},
    'property_type' => {:activator => '.property-select-holder input', :option_selector => ".property-select-holder input[value='%s']"},
    'min_price'     => {:activator => '.min.price.select-holder input', :option_selector => ".min.price li[data-value='%s']"},
    'max_price'     => {:activator => '.max.price.select-holder input', :option_selector => ".max.price li[data-value='%s']"}
  }

  def select_refinement(option, value)
    self.browser.find_element(:css => REFINEMENT_MAPPINGS[option][:activator]).click
    css_selector = REFINEMENT_MAPPINGS[option][:option_selector] % value
    self.browser.find_element(:css => css_selector).click
  end

end
