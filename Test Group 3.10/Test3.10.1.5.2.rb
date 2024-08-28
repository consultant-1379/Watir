#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.5.2 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_5_1 < CCGuiBaseTestClass
  def testPagingRightWorksHeaderControls
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    #Need to switch to all details, so that there are many pages to scroll through
    @@browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    tablePage1 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings


    @@browser.element(:xpath, SessionsTabTableHeaderXpath_CC).img(:src,'imgs/page_right_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    assert(tablePage1!=tablePage2)
  end

  def testPagingLeftWorksHeaderControls
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    #Need to switch to all details, so that there are many pages to scroll through
    @@browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    tablePage1 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    @@browser.element(:xpath, SessionsTabTableHeaderXpath_CC).img(:src,'imgs/page_right_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    assert(tablePage1!=tablePage2)
    @@browser.element(:xpath, SessionsTabTableHeaderXpath_CC).img(:src,'imgs/page_left_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(tablePage1==tablePage2)
  end

  def testPagingRightWorksFooterControls
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    #Need to switch to all details, so that there are many pages to scroll through
    @@browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    tablePage1 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings


    @@browser.element(:xpath, SessionsTabTableFooterXpath_CC).img(:src,'imgs/page_right_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    assert(tablePage1!=tablePage2)
  end

  def testPagingLeftWorksFooterControls
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    #Need to switch to all details, so that there are many pages to scroll through
    @@browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    tablePage1 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    @@browser.element(:xpath, SessionsTabTableFooterXpath_CC).img(:src,'imgs/page_right_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings

    assert(tablePage1!=tablePage2)
    @@browser.element(:xpath, SessionsTabTableFooterXpath_CC).img(:src,'imgs/page_left_enabled.png').click
    tablePage2 = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(tablePage1==tablePage2)
  end
end

