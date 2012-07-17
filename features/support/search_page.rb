class SearchPage
  include PageObject

  page_url "http://www.google.com"

  text_field(:search_field, :name => "q")
  button(:search, :name => "btnG")

  def search_for(search_query)
    self.search_field = search_query
    search
  end

  def search_results
    require 'ruby-debug'; debugger
    self.link_elements(:class => "l").map(&:text)
  end

end
