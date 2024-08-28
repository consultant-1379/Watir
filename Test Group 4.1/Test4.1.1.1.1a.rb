#########################################################################################################################
#                                                                                                                       #
#	Test 4.1.1.1 Browsers - Check and record supported browsers and browser versions                                      #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/BaseTestClass'

class Test4_1_1_1_1 < BaseTestClass

  def testFirefoxIsPreferredBrowser_soc
    startBrowser("Firefox")
    assert(isPreferredBrowser(@@browser),"Firefox is incorrectly identified as a non preferred browser" )
  end

  def testChromeIsPreferredBrowser_soc
    startBrowser("Chrome")
    assert(isPreferredBrowser(@@browser),"Chrome is incorrectly identified as a non preferred browser" )
  end

  def testInternetExplorerIsPreferredBrowser_soc
    startBrowser("Internet Explorer")
    assert(!isPreferredBrowser(@@browser),"Internet Explorer is incorrectly identified as a preferred browser" )
  end
end
