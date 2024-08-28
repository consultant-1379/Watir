ENV['no-http-proxy'] = "127.0.0.1"
require "test/unit"
require './modules/server-details'
require './modules/utilities'
require './modules/browser-elements'
require './modules/customer-data'


class BaseTestClass < Test::Unit::TestCase
  def startBrowser(browserName)
    case browserName
      when "Firefox"
        @@browser = start_ff(Server)
      when "Chrome"
        @@browser = start_chrome(Server)
      when "Internet Explorer"
        @@browser = start_ie(Server)
    end
  end

  def startBrowserNoCookies(browserName)
    case browserName
      when "Firefox"
        @@browser = start_ff_noCookies(Server)
      when "Chrome"
        raise "Disabling cookies in Chrome is not supported yet"
      when "Internet Explorer"
        raise "Disabling cookies in Internet Explorer is not supported yet"
    end
  end

  def teardown
    if(defined?(@@browser))
      @@browser.close
    end
  end
end