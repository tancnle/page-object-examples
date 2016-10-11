class RealEstateResultPage
  include PageObject

  def search_results
    self.div_elements(class: 'vcard').map(&:text)
  end
end
