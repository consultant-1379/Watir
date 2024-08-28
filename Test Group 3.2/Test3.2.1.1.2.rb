require './modules/BaseTestClass'
#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.1.1.2 Login -  Invalid password - check error                                                                #
#                                                                                                                       #
#########################################################################################################################                                                                

class Test3_2_1_1_2 < BaseTestClass
  def testLoginInvalidPassword
    createCCUser('watir_3212', 'Watir1234')
    begin
      startBrowser("Firefox")
      loginNoWait(@@browser, 'watir_3212', "SomeInvalidPassword3")
      assert(@@browser.text.include?("Wrong username or password"), 'User was able to login with a supposed invalid password')
    ensure
      deleteUser("watir_3212")
    end
  end
end
