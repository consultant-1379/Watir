#########################################################################################################################
#                                                                                                                       #
#	Test 3.3.1.1.2 - Start Session - Unrecognised subscriber number                                                            #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_3_1_1_2 < CCGuiBaseTestClass
  def testValidSubscriberNumber_unrecognisedImsi
    validImsi = "404685505601234"
    searchForImsiNoDate(@@browser, validImsi)
    assert(!@@browser.canvas(:id, 'indicators-result').exists?, "User can see a results table, for an unrecognised imsi")
    assert(@@browser.text.downcase.include?("no results found"), "The user was not notified that the IMSI that was entered was unrecognised")
  end
end

