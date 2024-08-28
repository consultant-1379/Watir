#########################################################################################################################
#                                                                                                                       #
#	Test 4.1.2.1.1 Browser Navigation - Check back/forward is disabled or behaviour is acceptable                         #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'


class Test4_1_1_2_1 < CCGuiBaseTestClass
  def testbackButtonDisabled_soc
    @@browser.back
    assert(!atLoginScreen(@@browser), 'Could navigate back to login screen')
  end
end