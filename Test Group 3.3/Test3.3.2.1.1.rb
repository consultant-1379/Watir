ENV['no-http-proxy'] = "127.0.0.1"
require './modules/utilities'
require './modules/cea-fileutils'
require './modules/server-details'

#########################################################################################################################
#                                                                                                                       #
# Test 3.3.2.1.1 - Start Session -  Check can close the session, subscriber number and customer data no longer visible  #
#                                                                                                                       #
#########################################################################################################################


require './modules/ccGuiBaseTestClass'
class Test3_3_2_1_1 < CCGuiBaseTestClass
  def testCanCloseSession
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickCloseButton(@@browser)
    assert(isSessionClosed(@@browser), "Session is not closed properly, we can still access last session")
  end
end
