#########################################################################################################################
#                                                                                                                       #
# Test 3.8.2.2.1 - Incidents Table - Check required columns                                                             #
#                                                                                                                       #
#########################################################################################################################

require './modules/ccGuiBaseTestClass'
class Test3_8_2_2_1 < CCGuiBaseTestClass

  def testincidentsTableInTroubleshootingTabContainsMostProbableCauseColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickTroubleShootingTab(@@browser)
    incidentsTable = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    incidentsTable.rows[0].cells.each { |e|
      if (e.text == 'Most Probable Cause');
        result = true;
      end }
    assert(result, 'Could not find a Column heading called Most  Probable  Cause in the Troubleshooting tab Incidents table')
  end

  def testincidentsTableInTroubleshootingTabContainsImpactedIndicatorColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickTroubleShootingTab(@@browser)
    incidentsTable = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    incidentsTable.rows[0].cells.each { |e|
      if (e.text == 'Impacted Indicator');
        result = true;
      end }
    assert(result, 'Could not find a Column heading called Impacted Indicator in the Troubleshooting tab Incidents table')
  end

  def testincidentsTableInTroubleshootingTabContainsIncidentCountColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickTroubleShootingTab(@@browser)
    incidentsTable = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    incidentsTable.rows[0].cells.each { |e|
      if (e.text == 'Incident Count');
        result = true;
      end }
    assert(result, 'Could not find a Column heading called Incident Count in the Troubleshooting tab Incidents table')
  end

  def testincidentsTableInTroubleshootingTabContainsCellsColumn
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickTroubleShootingTab(@@browser)
    incidentsTable = @@browser.table(:xpath, IncidentsTableXPath_CC)
    #Verify that the Sessionstable in the Sessions tab contains a time column
    result = false
    #verify the heading, do we need Time to be the first column or just any column
    incidentsTable.rows[0].cells.each { |e|
      if (e.text == 'Cells');
        result = true;
      end }
    assert(result, 'Could not find a Column heading called Cells in the Troubleshooting tab Incidents table')
  end
end