#########################################################################################################################
#                                                                                                                       #
#	Test 3.3.1.1.1 - Start Session - Invalid subscriber number                                                            #
#                                                                                                                       #
#########################################################################################################################

require './modules/ccGuiBaseTestClass'

class Test3_3_1_1_1 < CCGuiBaseTestClass
  def testInvalidSubscriberNumber_includesLetters
    invalidImsi = "45406330719gh9"
    searchForImsiNoDate(@@browser, invalidImsi)
    assert(!@@browser.canvas(:id, 'indicators-result').exists?, "User can see a results table, for an invalid imsi")
    assert(@@browser.text.downcase.include?("invalid imsi"), "The user was not notified that the IMSI that was entered was invalid")
  end

  def testInvalidSubscriberNumber_stupidlyLongImsi
    invalidImsi = "4540611030171111111111111111111112811111111111"
    searchForImsiNoDate(@@browser, invalidImsi)
    assert(!@@browser.canvas(:id, 'indicators-result').exists?, "User can see a results table, for an invalid imsi")
    assert(@@browser.text.downcase.include?("invalid imsi"), "The user was not notified that the IMSI that was entered was invalid")
  end

  def testInvalidSubscriberNumber_shortImsi
    invalidImsi = "1"
    searchForImsiNoDate(@@browser, invalidImsi)
    assert(!@@browser.canvas(:id, 'indicators-result').exists?, "User can see a results table, for an invalid imsi")
    assert(@@browser.text.downcase.include?("invalid imsi"), "The user was not notified that the IMSI that was entered was invalid")
  end
end