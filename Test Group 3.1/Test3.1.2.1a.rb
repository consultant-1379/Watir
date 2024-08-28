
#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.2.1a Browser Navigation - Check back/forward is disabled or behaviour is acceptable                        #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'


class Test3_1_1_2_1 < CCGuiBaseTestClass
  def testbackButtonDisabled
    @@browser.back
    assert(!atLoginScreen(@@browser), 'Could navigate back to login screen')
  end
end