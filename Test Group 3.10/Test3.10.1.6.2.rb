#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.5.2 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_6_2 < CCGuiBaseTestClass
  def testCheckThatTheIncidentPopuphasIncidentCount
    result = false
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    resulttable = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table')

    resulttable.rows[0].cells.each { |e|
      #puts e.text
      if (e.text == 'Incident Count');
        result = true;
      end
    }

    assert(result)
  end

end

