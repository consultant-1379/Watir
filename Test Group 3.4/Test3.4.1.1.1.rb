#########################################################################################################################
#                                                                                                                       #
# Test 3.4.1.1.1 - Customer and Plan -  Check honorific visible (eg. Mr)                                                #
#                                                                                                                       #
#########################################################################################################################                                                                
require './modules/ccGuiBaseTestClass'

class Test3_4_1_1_1 < CCGuiBaseTestClass
  def testCheckHonorificVisible
    expected = 'Mrs'
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(getCustomerNameInSidePanel(@@browser).include?(expected), "There is no honorific visible")
  end
end