#########################################################################################################################
#                                                                                                                       #
# Test 3.4.2.1.1 - Device Info -  Check device info visible and correct                                                 #
#                                                                                                                       #
#########################################################################################################################                                                                

require './modules/ccGuiBaseTestClass'

class Test3_4_2_1_1 < CCGuiBaseTestClass
  def testCheckDeviceInfoVisible
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)
    assert_equal('Sony Ericsson J105', getPhoneNameInSidePanel(@@browser))
    assert_equal('Mobile Handset', getPhoneTypeInSidePanel(@@browser))
    assert_equal('Proprietary v.UNKNOWN-OS-VERSION', getPhoneOSInSidePanel(@@browser))
  end
end