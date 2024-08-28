#########################################################################################################################
#                                                                                                                       #
#	Test 3.3.1.1.3 Start session - Recognised subscriber number, check customer data retrieved                            #
#                                                                                                                       #
#########################################################################################################################


require './modules/ccGuiBaseTestClass'
class Test3_3_1_1_3 < CCGuiBaseTestClass
  def testRecognisedSubscriberNumber
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    name = "Marge Simpson"
    msisdn = "0810000004"
    expected = "#{name} (#{msisdn})"
    assert_equal(expected, getCustomerNameAndMSISDNfromTitleBar(@@browser))
  end
end