#########################################################################################################################
#                                                                                                                       #
# Test 3.5.2.1.1 - Location -  No location specified - check applies correctly to all Report views                      #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_5_2_1_1 < CCGuiBaseTestClass
  def setup
    super
    imsiWithIssuesInMultipleLocations = "454063302429932"
    searchForImsi(@@browser, imsiWithIssuesInMultipleLocations, @@defaultDateFrom, @@defaultDateTo)
    clearLocation(@@browser)
  end

 def testNoLocationNumRows
    setLocationAndWait(@@browser, "") #ie clear the search filter

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    numRows = table.rows.size - 1
    assert_equal(3, numRows, "Expected only 3 rows of data, got #{numRows}")
  end

  def testNoLocationNumCells
    setLocationAndWait(@@browser, "")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    assert_equal("5", table.rows[1].cells[3].text, "Expected 2 cells with problems, got #{table.rows[1].cells[3].text}")
  end

  def setLocationAndWait(browser, location)
    setLocation(browser, location)
    #bit of a hacky bug here, need to wait for the incidents table to appear
    Watir::Wait.until { browser.table(:xpath, IncidentsTableXPath_CC).exists? }
  end

  def teardown
    clearLocation(@@browser)
    super
  end
end