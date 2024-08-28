#########################################################################################################################
#                                                                                                                       #
# Test 4.3.2.1.1 - Location -  No location specified - check applies correctly to all Report views                      #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/SocGuiBaseTestClass'

class Test4_3_2_1_1 < SocGuiBaseTestClass
  def setup
    super
    imsiWithIssuesInMultipleLocations = "454063302429932"
    searchForImsiForSoc(@@browser, imsiWithIssuesInMultipleLocations, @@defaultDateFrom, @@defaultDateTo)
    clearLocation_soc(@@browser)
  end

  def testNoLocationNumRows_soc
    setLocationAndWait_soc(@@browser, "") #ie clear the search filter

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    numRows = table.rows.size - 1
    assert_equal(3, numRows, "Expected only 3 rows of data, got #{numRows}")
  end

  def testNoLocationNumCells_soc
    setLocationAndWait_soc(@@browser, "")

    #Verify that there is the expected number of cells
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    assert_equal("5", table.rows[1].cells[3].text, "Expected 5 cells with problems, got #{table.rows[1].cells[3].text}")
  end

  def setLocationAndWait_soc(browser, location)
    setLocation_soc(browser, location)
    #bit of a hacky bug here, need to wait for the incidents table to appear
    Watir::Wait.until { browser.table(:xpath, IncidentsTableXpath_SOC).exists? }
  end

  def teardown
    clearLocation_soc(@@browser)
    super
  end
end