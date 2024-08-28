#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.1.1 - Sessions Table - Check that the table contains the Time column.                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_1_1 < CCGuiBaseTestClass
  def testSessionsTableInSessionsTabContainsTimeColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    sessionsTable.rows[0].cells.each { |e| if (e.text == 'Time'); result = true; end}
    assert(result, 'Could not find a Column heading called Time in the Sessions tab Sessions table' )
  end
end