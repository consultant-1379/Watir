#########################################################################################################################
#                                                                                                                       #
#	Test 4.2.1.1.1 Check Logout                                                                                           #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/socGuiBaseTestClass'
class Test4_2_2_1_1 < SocGuiBaseTestClass

  def testValiduserLogin_soc
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
    logout(@@browser)
    assert(atLoginScreen(@@browser),  'User could not log out')
  end
end
