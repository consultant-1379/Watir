#########################################################################################################################
#                                                                                                                       #
# Test 3.7.1.1.1 - Title - Check report panel title contains the customer name and date/time filter values when no location has been selected in filter                         #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_7_1_1_1 < CCGuiBaseTestClass
  def testReportPanelTitle
      searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
      expected = "Marge Simpson (0810000004) 17 May 00:00 - 17 May 23:59"
      result =
      assert_equal(expected, getFullTitleBar(@@browser))
  end

  def teardown
    clearLocation(@@browser) #Make sure to clear the location so it doesn't interfere with subsequent tests'
    @@browser.close
  end
end