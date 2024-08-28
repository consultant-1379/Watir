#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.1.2 - Access - Check SOC user can perform all cc operations                                                #
#                                                                                                                       #
#########################################################################################################################
require './modules/socGuiBaseTestClass'
class Test5_1_2_1_1 < SocGuiBaseTestClass

  def testSocUserCanPerfomCCOperations1a
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(clickMapTab_soc(@@browser), "The Soc User couldn't access the CC gui")
    assert(clickSessionsTab_soc(@@browser), "The Soc User couldn't access the CC gui")
    assert(clickTroubleShootingTab_soc(@@browser), "The Soc User couldn't access the CC gui")
  end

  #Check navigation from Incidents Table to Map tab
  def testSocUserCanPerfomCCOperations1b
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(openCloseSidebar(@@browser), "The Soc User couldn't access the CC gui")
  end

  #Check navigation from Incidents Table to Map tab
  def testSocUserCanPerfomCCOperations2
    assert(@@browser.text.include?("Logged as #{SocUser}"), 'User was not able to log in')
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(clickTroubleShootingTab_soc(@@browser), "The Soc User couldn't access the CC gui")
    table = @@browser.table(:xpath, IncidentsTableXpath_SOC)
    rowIndex = 0
    table.rows[1..-1].each do |row|
      if (rowIndex > 0)   #ignore the header row
        row.image(:src, 'imgs/cell-marker.png').hover
        @@browser.element(:xpath, CellPopupXPath_soc).click
        assert(isMapTabActive_soc(@@browser), "Could not determine if map tab was active in row #{rowIndex} of incidents table")
      end
      rowIndex += 1
      clickTroubleShootingTab_soc(@@browser)
    end
  end
end