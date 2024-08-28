#########################################################################################################################
#                                                                                                                       #
# Test 3.7.2.1.1 - Contents - Check that report panel contains (i) S-KPI bars panel.                                    #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_7_2_1_1 < CCGuiBaseTestClass
  def testReportPanelContainsSKpiBars
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(@@browser.canvas(:id, "indicators-result").exists?, "Could not find the S-KPI bars")
  end
end