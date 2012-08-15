module PageObject
  module PersistantBrowser

    @@browser = false

    def self.get_browser
      if !@@browser
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.timeout = 100
        @@browser = Selenium::WebDriver.for :firefox, :http_client => client
      end
      @@browser
    end

    def self.quit
      @@browser.close
    end
  end
end
