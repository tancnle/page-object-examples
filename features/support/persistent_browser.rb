module PageObject
  module PersistantBrowser
    def self.browser
      @browser ||= begin
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.open_timeout = 100
        client.read_timeout = 100

        Selenium::WebDriver.for :chrome, http_client: client, options: options
      end
    end

    def self.options
      args = %w[headless disable-gpu screenshot no-sandbox]

      Selenium::WebDriver::Chrome::Options.new(args: args)
    end
  end
end
