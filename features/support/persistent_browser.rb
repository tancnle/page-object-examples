module PageObject
  module PersistantBrowser
    def self.browser
      @_browser ||= begin
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.open_timeout = 100
        client.read_timeout = 100
        Selenium::WebDriver.for :chrome, http_client: client
      end
    end
  end
end
