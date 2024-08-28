require './modules/ccGuiBaseTestClass'

#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.2.1.1 Check Logout                                                                                           #
#                                                                                                                       #
#########################################################################################################################
class Test3_2_2_1_1 < CCGuiBaseTestClass

  def testValiduserLogin
    assert(@@browser.text.include?("Logged as #{CCUser}"), 'User was not able to log in')
    logout(@@browser)
    assert(atLoginScreen(@@browser),  'User could not log out')
  end
end
