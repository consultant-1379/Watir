#########################################################################################################################
#                                                                                                                       #
# Test 3.7.2.1.2 - Contents - Check that incidents panel contains Troubleshooting tab, Map tab, and Sessions tab        #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_7_2_2_1 < CCGuiBaseTestClass
  def testIncidentsPanelContainsMapTab
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(mapTabExists(@@browser), "Could not find map tab")
  end

  def testIncidentsPanelContainsSessionsTab
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(sessionsTabExists(@@browser), "Could not find sessions tab")
  end

  def testIncidentsPanelContainsTroubleshootingTab
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(troubleShootingTabExists(@@browser), "Could not find troubleshooting tab")
  end
end
