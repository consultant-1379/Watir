#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.6.7 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_6_7 < CCGuiBaseTestClass


  def testCheckThatTheIncidentPopuphasMapIconCheck
    answer = true
   searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)

    tablesize = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table').strings[1..-1].size


    for i in 2..tablesize
      xpathvariable = '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table/tbody/tr['+i.to_s+']/td[4]/table/tbody/tr/td[2]'
    #  p @@browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').present?
      if (@@browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').present? == false)
        answer = false
      end

    end
    assert(answer)
  end



  def testCheckThatTheIncidentPopuphasIncidentCountValueCheck1

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