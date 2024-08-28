#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.2.1 - Date/time filter -  Start too far back in time                                                       #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_5_1_2_1 < CCGuiBaseTestClass
  def testStartTooFarBackInTimeRanges
    searchForImsi(@@browser, @@defaultIMSI, '17/05/1899 00:00:00', @@defaultDateTo)

    warningMsg = @@browser.element(:xpath,'/html/body/div[8]')


    assert(warningMsg.present?, 'No warning dialog was shown when entering in a date before 01-01-1900 00:00:00')
    assert(warningMsg.text.include?("Dates should be later than 01/01/1900 00:00:00"))

  end
end