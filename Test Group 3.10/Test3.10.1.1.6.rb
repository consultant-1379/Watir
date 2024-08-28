#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.1.6 - Sessions Table - Check that the table contains the Probable causes column.                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_1_6 < CCGuiBaseTestClass
  def testSessionsTableInSessionsTabContainsProbablecausesColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    sessionsTable.rows[0].cells.each { |e| if (e.text == 'Probable causes'); result = true; end}
    assert(result, 'Could not find a Column heading called Probable causes in the Sessions tab Sessions table' )
  end
end