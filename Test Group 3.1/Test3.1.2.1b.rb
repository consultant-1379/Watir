require './modules/ccGuiBaseTestClass'

#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.2.1b Browser Navigation - Check back/forward is disabled or behaviour is acceptable                        #
#                                                                                                                       #
#########################################################################################################################                                                                
class Test3_1_1_2_1b < CCGuiBaseTestClass
  def testForwardButtonDisabled
    @@browser.back
    @@browser.forward
    waitForLoginToComplete(@@browser)
    assert(!isUserLoggedIn(@@browser, CCUser), 'Could navigate back to login screen and forward to UI')
  end
end
