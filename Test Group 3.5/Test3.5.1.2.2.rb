require './modules/ccGuiBaseTestClass'
#########################################################################################################################
#                                                                                                                       #
# Test 3.5.1.2.2 - Date/time filter -  End before start                                                                 #
#                                                                                                                       #
#########################################################################################################################                                                                
class Test3_5_1_2_2 < CCGuiBaseTestClass
  def testEndDateBeforeStartdate
    enterSearchDate(@@browser, '17/06/2012 00:00:00', '17/05/2012 23:59:59')
    assert(@@browser.element(:xpath, DateTimeErrorXPath).present?, "No warning dialog shown to user")
    assert_equal(@@browser.element(:xpath, DateTimeErrorXPath).text, "Initial date must be before final date")
  end
end