#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.3.1 - Date/time filter -  Check most recent data can be located and shown with selected range              #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_5_1_3_1 < CCGuiBaseTestClass

  def setup
    super
    dateNow =  DateTime.now
    toDate = dateNow.strftime('%d/%m/%Y %H:%M:%S')
    #current date time - 1 days
    dateMinus1 = dateNow - 1
    fromDate = dateMinus1.strftime('%d/%m/%Y %H:%M:%S')
    #p "#{fromDate} - #{toDate}"
    searchForImsi(@@browser, @@defaultIMSI, fromDate,toDate)
  end


  def testCheckMostRecentDataCanBeLocated
    assert(@@browser.table(:xpath, WarningTableXPath).present?, "No warning dialog shown to user")
  end
end