
#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.1.1.3 Invalid Password, check lockout                                                                        #
#                                                                                                                       #
#########################################################################################################################
require './modules/BaseTestClass'

class Test3_2_1_1_2 < BaseTestClass
  def testLoginInvalidPasswordLockout
    createCCUser('watir_invalid', 'Watir1234')
    begin
      startBrowser("Firefox")
      5.times{
        loginNoWait(@@browser, 'watir_invalid', 'Watir')
      }
      assert(@@browser.text.include?("Account blocked after several wrong login attemps. Please, contact system administrator"), 'Account was not locked after 4 failed login attempts')
    ensure
      deleteUser('watir_invalid')
    end
  end
end