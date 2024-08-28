#########################################################################################################################
#                                                                                                                       #
# Test 3.7.2.2.1 - Contents - Check that report panel contains incidents panel.                                         #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_7_2_2_1 < CCGuiBaseTestClass
  def testReportPanelContainsIncidents
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(@@browser.canvas(:class, "EVENTS_TIMELINE").exists?, "Could not find theIncidents Panel")
  end
end
