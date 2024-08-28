#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.5.2 - Sessions Tab - Check table view is updated when paging controls are used                            #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_10_1_5_3 < CCGuiBaseTestClass
  def testCheckThatTheDefaultNumberOfRowsButton
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)

     expected ="gwt-ToggleButton sessionCount-button session-option-item gwt-ToggleButton-down-disabled"
     result = @@browser.element(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[3]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/div').attribute_value("class")
    #p result.attribute_value("class")
    #puts expected
    #print result
    assert(expected == result)
  end

  def testCheckThatTheDefaultNumberOfRowsCount
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    clickSessionsTab(@@browser)

    expected ="gwt-ToggleButton sessionCount-button session-option-item gwt-ToggleButton-down-disabled"
    result = @@browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[3]/table/tbody/tr[3]/td/div/div/div/table').strings
    count =result[1..-1].count()
    assert(count <=20)
  end
end

