#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.1.1 - Access - Check SOC user can access CC GUI                                                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/socGuiBaseTestClass'
class Test5_1_1_1_1 < SocGuiBaseTestClass

  def testSocUserCanAccessCCGui
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(openCloseSidebar(@@browser), "The Soc User couldn't access the CC gui")
    assert(clickMapTab_soc(@@browser), "The Soc User couldn't access the CC gui")
    assert(clickSessionsTab_soc(@@browser), "The Soc User couldn't access the CC gui")
    assert(clickTroubleShootingTab_soc(@@browser), "The Soc User couldn't access the CC gui")
  end

end