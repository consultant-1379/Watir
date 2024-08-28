#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.3.1.2 Check Height                                                                                           #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_1_3_1_2  < CCGuiBaseTestClass
  def testHeightOfMainPanel
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(getResultAreaHeight(@@browser) <= 768, "Height exceeds max guideline of 768")
  end
end

