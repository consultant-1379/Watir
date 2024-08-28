#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.2.3 - Date/time filter -  Check valid selection applies correctly to all Report views                      #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_5_1_2_3 < CCGuiBaseTestClass
    @@toDate
    @@fromDate
    @@dateMinus1

  def setup
    super
    #dateNow =  DateTime.now
    dateNow = DateTime.parse('17/05/2012 23:59:59')
    @@toDate = dateNow.strftime('%d/%m/%Y %H:%M:%S')
    #current date time - 1 days
    @@dateMinus1 = dateNow - 1
    @@fromDate = @@dateMinus1.strftime('%d/%m/%Y %H:%M:%S')
    searchForImsi(@@browser, @@defaultIMSI, @@fromDate,@@toDate)
  end

  def testCheckValidSelectionAppliesReportViews
    reportMenu_FromDate = @@browser.text_field(:xpath,FromDateReportMenuXPath)
    reportMenu_ToDate = @@browser.text_field(:xpath,ToDateReportMenuXPath)

    assert_equal(reportMenu_FromDate.value, @@fromDate.to_s)
    assert_equal(reportMenu_ToDate.value, @@toDate.to_s)

    @@browser.select_list(:xpath, RangeReportMenuXPath).select('Previous day')
    @@browser.element(:xpath, ApplyButtonReportMenuXPath).click
    table = @@browser.table(:xpath, ReportForTableXPath)

    if(table.present?)
      tableRow = table.rows
      dateMinus2 = @@dateMinus1 - 1
      warningtable = @@browser.table(:xpath,WarningTableXPath)
      if(table.present?)
        warningtableRow = warningtable.rows
      end
      assert_equal("#{dateMinus2.strftime('%d %b %H:%M')} - #{@@dateMinus1.strftime('%d %b %H:%M')}", tableRow[0][2].text)
   end
  end
end