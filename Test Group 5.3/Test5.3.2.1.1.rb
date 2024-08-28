require './modules/socGuiBaseTestClass'
class Test5_3_2_1_1 < SocGuiBaseTestClass

  def testThereisReportForAvgEcno
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    @@browser.element(:xpath, SocUserSidePanelXPath_soc).hover
    table = @@browser.table(:xpath, '/html/body/div[7]/div/table/tbody/tr[2]/td/div/div/table')
    avgEcno = "Average EcN0"
    result = false
    table.rows.each do |row|
      row.cells.each do |cell|
        if(cell.text.include?(avgEcno))
          result = true
        end
      end
    end
    assert(result, "Could not find a report called #{avgEcno}")
  end
end
 