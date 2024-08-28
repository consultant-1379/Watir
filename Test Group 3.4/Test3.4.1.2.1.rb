require './modules/ccGuiBaseTestClass'

#########################################################################################################################
#                                                                                                                       #
# Test 3.4.1.2.1 - Customer and Plan -  Check customer plan info visible                                                #
#                                                                                                                       #
#########################################################################################################################
class Test3_4_1_2_1 < CCGuiBaseTestClass
  def testVerifyValueInSidePanel
    expected = "8/10"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getValueInSidePanel(@@browser))
  end

  #def testVerifyMsisdnInSidePanel
  #  expected = "0810000004"
  #  searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
  #  assert_equal(expected, getMsisdnInSidePanel(@@browser))
  #end

  def testVerifyChurnInSidePanel
    expected = "Low-5%"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getChurnInSidePanel(@@browser))
  end

  def testVerifyInfluenceInSidePanel
    expected = "High"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getInfluenceInSidePanel(@@browser))
  end

  def testVerifyAgeOnNetworkInSidePanel
    expected = "7 Years 11 Months"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getAgeInSidePanel(@@browser))
  end


  def testVerifyStatusOnNetworkInSidePanel
    expected = "Active"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getStatusInSidePanel(@@browser))
  end

  def testVerifyPlanOnNetworkInSidePanel
    expected = "Unlimited Voice + Data"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getPlanInSidePanel(@@browser))
  end

  def testVerifyPlanTypeOnNetworkInSidePanel
    expected = "Postpaid"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getPlanTypeInSidePanel(@@browser))
  end

  def testVerifyDataOnNetworkInSidePanel
    expected = "1GB + Unlimited Social Networking"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getDataInSidePanel(@@browser))
  end

  def testVerifyDataUsageOnNetworkInSidePanel
    expected = "524Mb"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getDataUsageInSidePanel(@@browser))
  end

  def testVerifyMainUsageOnNetworkInSidePanel
    expected = "Web browsing"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getMainUsageInSidePanel(@@browser))
  end

  def testVerifyPaymentOnNetworkInSidePanel
    expected = "No issues"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getPaymentInSidePanel(@@browser))
  end
end