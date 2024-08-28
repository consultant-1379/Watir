#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.3.1 - Sessions Table - Check  that Indicator compared values are blank if no comparisons selected.                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_3_1 < CCGuiBaseTestClass
  def testSessionsTableInIndicatorComparredValuesBlankIfNoComparison
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    #Verify that Indicator compared values are blank if no comparisons selected
    result = true

    #verify Indicator compared values are blank if no comparisons selected.
    rowIndex = 0
    sessionsTable.rows[1..-1].each do |row|
      if (row.cells[3].text != "")
        result = false
      end
    end
    assert(result, 'could not find empty cells in indicator compared column')
  end
end

