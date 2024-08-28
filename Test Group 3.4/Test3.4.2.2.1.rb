#########################################################################################################################
#                                                                                                                       #
# Test 3.4.2.2.1 - Device Info -  Check indication visible for problematic  device types                                #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_4_2_2_1 < CCGuiBaseTestClass
  def testIndicationVisibleforProblematicDeviceTypes
	searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    #assert_equal('sometext', method)
  end
end