########################################################################################################################
#                                                                                                                       #
# Test 3.8.2.4.1 - Incidents Table - Cells column contains link to map tab                                              #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'
class Test3_8_2_4_1 < CCGuiBaseTestClass

  def testincidentsTableInTroubleshootingTabContainsMostProbableCauseColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    table = @@browser.table(:xpath, IncidentsTableXPath_CC)
    rowIndex = 0
    table.rows.each do |row|
      if (rowIndex > 0)   #ignore the header row
        row.image(:src, 'imgs/cell-marker.png').hover
        @@browser.element(:xpath, CellPopupXpath).click
        assert(isMapTabActive(@@browser), "Could not determine if map tab was active in row #{rowIndex} of incidents table")
      end
      rowIndex += 1
      clickTroubleShootingTab(@@browser)
    end
  end
end