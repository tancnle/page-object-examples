Before do
  @browser = PageObject::PersistantBrowser.browser

  PageObject.default_element_wait = 60
  PageObject.default_page_wait = 60
end
