#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.1.5 - Sessions Table - Check that the table contains the Incidents column.                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_1_5 < CCGuiBaseTestClass
  def testSessionsTableInSessionsTabContainsIncidentsColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    sessionsTable.rows[0].cells.each { |e| if (e.text == 'Incidents'); result = true; end}
    assert(result, 'Could not find a Column heading called Incidents in the Sessions tab Sessions table' )
  end
end