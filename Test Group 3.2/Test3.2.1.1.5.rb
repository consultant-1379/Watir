
#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.1.1.5 Login -  Valid username - check error                                                                  #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'
class Test3_1_1_1_5 < CCGuiBaseTestClass

  def testValiduserLogin
    assert(@@browser.text.include?("Logged as #{CCUser}"), 'User was not able to log in')
  end
end