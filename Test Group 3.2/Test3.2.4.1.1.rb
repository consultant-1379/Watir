require './modules/BaseTestClass'

#########################################################################################################################
#                                                                                                                       #
#	Test 3.2.4.1.1 - Multiple logins - Check it is possible to login and use CC GUI using multiple browser windows        #
#                                                                                                                       #
#########################################################################################################################                                                                
class Test3_2_3_2_1 < BaseTestClass
  def testMultipleBrowsersOneLogin
    startBrowser("Firefox")
    browser1 = @@browser
    login(browser1, CCUser, Password)

    startBrowser("Chrome")
    browser2 = @@browser
    login(browser2, CCUser, Password)

    enterImsi_noWait(browser1, 454061103017281)
    assert(browser1.text.downcase.include?("invalid session"), "Our second login interferred with the first")
    browser1.close
  end
end

