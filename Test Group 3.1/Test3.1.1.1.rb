
#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.1.1 Browsers - Check and record supported browsers and browser versions                                    #
#                                                                                                                       #
#########################################################################################################################
require './modules/BaseTestClass'

class Test3_1_1_1_1a < BaseTestClass

  def testFirefoxIsPreferredBrowser
    startBrowser("Firefox")
    assert(isPreferredBrowser(@@browser),"Firefox is incorrectly identified as a non preferred browser" )
  end

  def testChromeIsPreferredBrowser
    startBrowser("Chrome")
    assert(isPreferredBrowser(@@browser),"Chrome is incorrectly identified as a non preferred browser" )
  end

  def testInternetExplorerIsPreferredBrowser
    startBrowser("Internet Explorer")
    assert(!isPreferredBrowser(@@browser),"Internet Explorer is incorrectly identified as a preferred browser" )
  end
end
