#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.3.1.1 - 1024 max width -  Check width of main panel                                                          #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'

class Test3_1_3_1_1 < CCGuiBaseTestClass
  def testWidthOfMainPanel
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert(getResultAreaWidth(@@browser) <= 1024, "Width exceeds max guideline of 1024")
  end
end