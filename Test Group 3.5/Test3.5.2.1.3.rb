###########################################################################################prompy##############################
#                                                                                                                       #
# Test 3.5.2.1.3 - Location -  Valid location - check applies correctly to all Report views                             #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_5_2_1_3 < CCGuiBaseTestClass

  def setup
    super
    imsiWithIssuesInMultipleLocations = "454063302429932"
    searchForImsi(@@browser, imsiWithIssuesInMultipleLocations, @@defaultDateFrom, @@defaultDateTo)
    clearLocation(@@browser)
  end


  def testCheckValidLocationNumRowsNoLocation
    setLocationAndWait(@@browser, "") #ie clear the search filter

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    numRows = table.rows.size - 1
    assert_equal(3, numRows, "Expected only 3 rows of data, got #{numRows}")
  end

  def testValidLocationNumRows
    setLocationAndWait(@@browser, "Athlone")
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    numRows = table.rows.size - 1
    assert_equal(1, numRows, "Expected only 1 rows of data, got #{numRows}")
  end

  def testValidLocationNumCellsNoLocation
    setLocationAndWait(@@browser, "")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    assert_equal("5", table.rows[1].cells[3].text, "Expected 5 cells with problems, got #{table.rows[1].cells[3].text}")
  end


  def testValidLocationNumCells
    setLocationAndWait(@@browser, "Athlone")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    numCells = table.rows[1].cells[3].text
    assert_equal("3", numCells, "Expected 5 cells with problems, got #{numCells}")
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