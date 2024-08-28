#########################################################################################################################
#                                                                                                                       #
# Test 3.7.2.2.2 - Contents -  Check that incidents panel a common indicator selector.                                  #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_7_2_2_2 < CCGuiBaseTestClass
  def testIncidentsPanelContainsCommonIndicatorSelector
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    incidentTable = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Check to see if the incident table exist.
    assert(incidentTable.present?, "Incident table not present")
    rows = incidentTable.rows
    (1...rows.length).each do |x|
      #p  rows[x][2].text
      @@browser.element(:xpath,"//*[@id='resultarea']/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table/tbody/tr[#{x+1}]/td[3]/div").fire_event "onmouseover"
      assert(@@browser.element(:xpath,"/html/body/div[7]/div/div/table/tbody/tr/td[1]/table/tbody/tr/td").present?, "Incident pop-up not present")
      end
  end
end