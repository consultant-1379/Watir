#########################################################################################################################
#                                                                                                                       #
# Test 3.5.2.1.2 - Location -  Invalid location - check error message                                                   #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

#We are defining an Invalid location as one that is not in the cell.csv file.
#A location that is in the CSV is a valid location but might not prodce results.
class Test3_5_2_1_2 < CCGuiBaseTestClass

  def setup
    super
    imsiWithIssuesInMultipleLocations = "454063302429932"
    searchForImsi(@@browser, imsiWithIssuesInMultipleLocations, @@defaultDateFrom, @@defaultDateTo)
    clearLocation(@@browser)
  end


  def testInvalidLocation_No_Incidents
    setLocation(@@browser, "timbuktu")
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Check to see if the incidents table exist.
    assert(!@@browser.table(:xpath, IncidentsTableXPath_CC).present?, "Incident table present, this should not be the case.")
   #Check to see if the warning table exist.
    warningTable = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr[2]/td/table')
    Watir::Wait.until {warningTable.present?}
    assert(warningTable.present?, "No Warning dialog shown to user.")
  end

end 