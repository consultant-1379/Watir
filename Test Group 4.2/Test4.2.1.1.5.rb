#########################################################################################################################
#                                                                                                                       #
#	Test 4.2.1.1.5 Login -  Invalid username - check error                                                                #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/socGuiBaseTestClass'
class Test4_1_1_1_5 < SocGuiBaseTestClass

  def testValiduserLogin_soc
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
  end
end