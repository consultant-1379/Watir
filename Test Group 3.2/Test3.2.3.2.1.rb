require './modules/BaseTestClass'

#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.3.2.1 Preferences - Forbid Cookies                                                                           #
#                                                                                                                       #
#########################################################################################################################

class Test3_2_3_2_1 < BaseTestClass
  def testForbidCookies
    startBrowserNoCookies("Firefox")
    assert(@@browser.text.include?("Please, enable cookies in your browser!"), "CEA is not detecting that cookies are disabled")
  end

  def testForbidCookiesEnableThemAgain
    startBrowserNoCookies("Firefox")
    assert(@@browser.text.include?("Please, enable cookies in your browser!"), "CEA is not detecting that cookies are disabled")
    @@browser.close
    startBrowser("Firefox")
    assert(!@@browser.text.include?("Please, enable cookies in your browser!"), "CEA is not detecting that cookies are enabled")
  end
end






