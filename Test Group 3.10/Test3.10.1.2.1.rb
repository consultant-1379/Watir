#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.2.1 - Sessions Tab - Check that by default the only rows shown in the table are those with incidents      #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_2_1 < CCGuiBaseTestClass
  def testSessionsTabSessionsTableOnlyContainsIncidentsByDefault
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    incidents = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(incidents[1..-1].all? { |row| !row[4].empty? }, "Incidents table contains more than just incidents") #Check that the incidents column is 1
  end
end

