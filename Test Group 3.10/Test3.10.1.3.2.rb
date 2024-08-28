#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.3.2 - Sessions Table - Check that Indicator compared values are correct for Users at same location selected. #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_3_2 < CCGuiBaseTestClass
  def testSessionsTableInIndicatorComparredValuescorrectforUserAtsameLocation
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    #Verify that Indicator compared values are correct for user at same location.
    result = false
    #verify that Indicator compared values are correct for user at same location.
    #@browser.radio(:id, "gwt-uid-47").set
    selectRadioUserAtSameLocation(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    rowIndex = 0
    sessionsTable.rows[1..-1].each do |row|
      if (row.cells[7].text == "1") && (row.cells[3].text != "")
        result = true
      end
    end
    assert(result, 'could not find coorect values at indicator compared column.')
  end
end