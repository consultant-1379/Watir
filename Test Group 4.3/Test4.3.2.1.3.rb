
#########################################################################################################################
#                                                                                                                       #
# Test 4.3.2.1.3 - Location -  Valid location - check applies correctly to all Report views                             #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/SocGuiBaseTestClass'

class Test4_3_2_1_3 < SocGuiBaseTestClass

  def setup
  
  super
    imsiWithIssuesInMultipleLocations = "454063302429932"
    searchForImsi(@@browser, imsiWithIssuesInMultipleLocations, @@defaultDateFrom, @@defaultDateTo)
    clearLocation_soc(@@browser)
  end


  def testCheckValidLocationNumRowsNoLocation_SOC
    setLocationAndWait(@@browser, "") #ie clear the search filter

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    numRows = table.rows.size - 1
    assert_equal(3, numRows, "Expected only 3 rows of data, got #{numRows}")
  end

  def testValidLocationNumRows_SOC
    setLocationAndWait(@@browser, "Athlone")
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    numRows = table.rows.size - 1
    assert_equal(1, numRows, "Expected only 2 rows of data, got #{numRows}")
  end

  def testValidLocationNumCellsNoLocation_SOC
    setLocationAndWait(@@browser, "")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    assert_equal("5", table.rows[1].cells[3].text, "Expected 5 cells with problems, got #{table.rows[1].cells[3].text}")
  end


  def testValidLocationNumCells_SOC
    setLocationAndWait(@@browser, "Athlone")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    numCells = table.rows[1].cells[3].text
    assert_equal("3", numCells, "Expected 5 cells with problems, got #{numCells}")
  end

begin
  def setLocationAndWait(browser, location)
    setLocation_soc(browser, location)
    #bit of a hacky bug here, need to wait for the incidents table to appear
    Watir::Wait.until { browser.table(:xpath, IncidentsTableXpath_SOC).exists? }
  end
end

  def teardown
    clearLocation_soc(@@browser)
    super
  end
end