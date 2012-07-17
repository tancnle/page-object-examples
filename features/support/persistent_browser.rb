module PageObject
  module PersistantBrowser
    @@browser = false
    def self.get_browser
      if !@@browser
         @@browser =  Selenium::WebDriver.for :firefox
      end
      @@browser
    end
    def self.quit
      @@browser.quit
    end
  end
end
