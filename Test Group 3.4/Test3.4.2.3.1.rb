#########################################################################################################################
#                                                                                                                       #
# Test 3.4.2.3.1 - Device Info -  Check indication visible for problematic  device OS versions                          #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_4_2_3_1 < CCGuiBaseTestClass
  def testIndicationVisibleforProblematicOSVersions
	searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    #assert_equal('sometext', method)
  end
end