#########################################################################################################################
#                                                                                                                       #
# Test 3.3.2.1.2 - Start Session -  Check that browser Back is disabled or that Back does not access previous CC session#
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_3_2_1_2 < CCGuiBaseTestClass
  def testBrowserBackDoesntAccessPreviousCCSessiona
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    logout(@@browser)
    #Do we need to do this???
    login(@@browser, CCUser, Password)
    2.times{ @@browser.back}
    waitForLoginToComplete(@@browser)
    #Shouldn't be back at a logged in screen. Lets see
    assert(isSessionClosed(@@browser), "Previous user searches are available")
  end

  def testBrowserBackDoesntAccessPreviousCCSessionb
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    logout(@@browser)
    #Do we need to do this???
    login(@@browser, CCUser, Password)
    2.times{ @@browser.back}
    waitForLoginToComplete(@@browser)
    #Shouldn't be back at a logged in screen. Lets see
    assert(isSessionClosed(@@browser), "Previous user searches are available")
  end
end
