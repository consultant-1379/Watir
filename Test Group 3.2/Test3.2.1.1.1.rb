
#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.1.1.1 Login -  Invalid username - check error                                                                #
#                                                                                                                       #
#########################################################################################################################
require './modules/BaseTestClass'
class Test3_2_1_1_1 < BaseTestClass
  def testLoginInvalidUsername
    startBrowser("Firefox")
    loginNoWait(@@browser, "watir_invalidusername", "Watir123")
    assert(@@browser.text.include?("Wrong username or password"), 'User was able to login with a supposed invalid username')
  end
end