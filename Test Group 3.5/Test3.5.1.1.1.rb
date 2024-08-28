#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.1.1 - Date/time filter -  Check all supplied ranges                                                        #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_5_1_1_1 < CCGuiBaseTestClass
  def testCheckallsuppliedRanges
    fromDate = '01/01/1900 00:00:00'
    dateNow =  DateTime.now
    toDate = dateNow.strftime('%d/%m/%Y %H:%M:%S')
    enterSearchDate(@@browser,fromDate,toDate)
    popUp = @@browser.element(:xpath, DateTimeErrorXPath)
    #Check to see if pop is NOT present
    assert(!popUp.present?, "Error pop up present for time entered: #{fromDate} - #{toDate}")
    fromDate = '31/12/1899 00:00:00'
    enterSearchDate(@@browser,fromDate,toDate)
    popUp = @@browser.element(:xpath, DateTimeErrorXPath)
    assert(popUp.present?, "Error pop up not present for time entered: #{fromDate} - #{toDate}")
    assert_equal(@@browser.element(:xpath, DateTimeErrorXPath).text, "Dates should be later than 01/01/1900 00:00:00")
  end
end