#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.2.2 - Sessions Tab - Check that user can show all rows, irrespective of incidents                         #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_2_2  < CCGuiBaseTestClass
  def testUserCanDisplayAllSessionsInSessionsTable
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)
    incidents = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(incidents[1..-1].all? { |row| !row[4].empty? }, "Incidents table contains more than just incidents") #Check that the incidents column is 1

    #Show all details
    @@browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    incidents = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(incidents[1..-1].any? { |row| !row[4].empty? }, "Can only see incidents in the table, after clicking show all details") #Check that the incidents column is 1

    #Switch back to incidents only and make sure that it is still ok
    @@browser.element(:xpath, SessionsTabShowIncidentsLinkXpath_CC).click
    incidents = @@browser.table(:xpath, SessionsTabSessionsTableXpath_CC).strings
    assert(incidents[1..-1].all? { |row| !row[4].empty? }, "Incidents table contains more than just incidents") #Check that the incidents column is 1

  end
end

