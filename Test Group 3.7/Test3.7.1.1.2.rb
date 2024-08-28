#########################################################################################################################
#                                                                                                                       #
# Test 3.7.1.1.2 - Title -  Check report panel title contains the customer name, date/time filter values, and location when a location has been selected in filter   #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_7_1_1_2 < CCGuiBaseTestClass
  def testReportPanelTitleWhenLocationSpecified
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clearLocation(@@browser) #Just in case a previous test failed, or someone else has set a location
    expected = "Marge Simpson (0810000004) 17 May 00:00 - 17 May 23:59"
    assert_equal(expected, getFullTitleBar(@@browser))
    setLocation(@@browser, "Galway")
    expectedWithLocation = expected + " Galway"
    assert_equal(expectedWithLocation, getFullTitleBar(@@browser))
    clearLocation(@@browser)
    assert_equal(expected, getFullTitleBar(@@browser))
  end

  def teardown
    clearLocation(@@browser)
    super #call super class teardown method
  end
end