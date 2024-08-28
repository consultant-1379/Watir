
#########################################################################################################################
#                                                                                                                       #
# Test 3.4.1.1.2 - Customer and Plan -  Check customer name visible                                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_4_1_1_2 < CCGuiBaseTestClass
def testVerifynameInSidePanel
    expected = "Marge Simpson"
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal(expected, getCustomerNameInSidePanel(@@browser))
  end
end
