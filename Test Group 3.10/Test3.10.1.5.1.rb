#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.5.1 - Sessions Tab - Check Paging controls appear at top and bottom of page                               #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_5_1 < CCGuiBaseTestClass
  def testStandardPagingControlsAtTopOfPage
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    tableHeader = @@browser.element(:xpath, SessionsTabTableHeaderXpath_CC)
    assert(areLeftPagingControlsVisible(tableHeader), "No page left control present at top of page")
    assert(areRightPagingControlsVisible(tableHeader), "No page right control present at top of page")
  end

  def testStandardPagingControlsAtBottomOfPage
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    tableFooter= @@browser.element(:xpath, SessionsTabTableFooterXpath_CC)
    assert(areLeftPagingControlsVisible(tableFooter), "No page left control present at foot of page")
    assert(areRightPagingControlsVisible(tableFooter), "No page right control present at foot of page")
  end
end

