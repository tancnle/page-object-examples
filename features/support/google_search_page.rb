class GoogleSearchPage
  include PageObject

  page_url 'http://www.google.com.au'

  text_field(:search_field, name: 'q')
  button(:search, name: 'btnG')

  def search_for(search_query)
    self.search_field = search_query
    search
    wait_until(60, 'Google search is so slooooooow!') do
      self.text[/About .* results \(.* seconds\)/]
    end
  end

  def search_results
    self.link_elements(css: '.r>a').map(&:text)
  end
end
