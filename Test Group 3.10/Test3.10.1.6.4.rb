#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.6.4 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_6_4 < CCGuiBaseTestClass

  def testCheckThatTheIncidentPopuphasIncidentCountLinkCheck
    answer = false
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    #Find Table Size
    incidentTable = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table')

    rows = incidentTable.rows
    check = []
    for i in 2..rows.length

      xpathvariable = '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table/tbody/tr['+i.to_s+']/td[3]/div'

      @@browser.element(:xpath, xpathvariable).fire_event("onmouseover")
      resulttable = @@browser.table(:xpath, '/html/body/div[8]/div/div/table/tbody/tr/td[1]/table/tbody/tr/td/div/table/tbody/tr[2]/td/div/div/div/table')

      if (resulttable.present?)
        (resulttable.rows.length-1 == rows[i-1][2].text.to_i) ? answer = true : answer = false
      end
      check << answer
    end
    assert(!check.include?(false))
  end


end



