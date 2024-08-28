require "test/unit"
require './modules/server-details'
require './modules/utilities'
require './modules/browser-elements'
require './modules/customer-data'

class SocGuiBaseTestClass < Test::Unit::TestCase
  @@defaultIMSI = '454061103017281'
  @@defaultDateFrom = '17/05/2012 00:00:00'
  @@defaultDateTo = '17/05/2012 23:59:59'
  @@browser

  def setup
    #Lets create our own user for these tests
    @@browser = start_ff(Server)
    login(@@browser, SocUser, Password)
  end

  def teardown
    @@browser.close
  end
  # To change this template use File | Settings | File Templates.
end