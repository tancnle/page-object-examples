class SeekHomePage
  include PageObject

  page_url 'http://www.seek.com.au'

  select_list(:classification, name: 'industry')
  select_list(:sub_classification, name: 'occupation')
  select_list(:location, name: 'parentlocation')
  button(:seek_button, name: 'DoSearch')

  def seek(search_criteria)
    search_criteria.each do |criterion|
      self.send('#{criterion[:name]}=', criterion[:value])
    end
    seek_button
    wait_until { self.text.include? 'jobs matching your search criteria' }
  end

  def search_results
    self.link_elements(css: '.job-title').map(&:text)
  end
end
