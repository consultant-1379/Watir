#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.5.3 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_6_3 < CCGuiBaseTestClass

  def testCheckThatTheIncidentPopuphasIncidentCountValueCheck
    answer = false
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    resulttable = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table')
    rows = resulttable.rows

    for i in 1..rows.length-1
      value =rows[i][2].text
      if (value.to_i > 1)
        answer = true
      end
     end

      assert(answer)
    end
  end
