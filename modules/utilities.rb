require 'watir-webdriver'
require './modules/browser-elements'



#########################################################################################################################
#                                                                                                                       #
#                                          Customer Information                                                         #
#                                                                                                                       #
#########################################################################################################################
Name = "Marge Simpson"
Imsi = "454061103017281"
MSISDN = "0810000004"
Value = "8/10"
Churn_Score = "Low-5%"
Influence_Score = "High"
Age_on_Network = "7 Years 11 Months"
Status = "Active"
Plan = "Unlimited Voice + Data"
Plan_Type = "Postpaid"
Data_plan = "1GB + Unlimited Social Networking"
Data_Usage = "524Mb"
Main_Usage = "Web browsing"
Payment = "No issues"



#########################################################################################################################
#                                                                                                                       #
#                                    Methods that start the browser windows                                             #
#                                                                                                                       #
#########################################################################################################################

def start_ie(url)
  Watir::Browser.start(url, :ie)
end

def start_ff(url)
  browser = Watir::Browser.start(url, :ff)
  screen_width = browser.execute_script("return screen.width;")
  screen_height = browser.execute_script("return screen.height;")
  browser.driver.manage.window.resize_to(screen_width,screen_height)
  browser
end

def start_chrome(url)
  Watir::Browser.start(url, :chrome)
end

=begin
  Start Firefox with no cookies. Useful for testing that CEA doesn't work unless cookies are enabled
=end
def start_ff_noCookies(url)
  #Create a new profile for this instance
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["network.cookie.cookieBehavior"] = 2 #Turn off cookies
  driver = Selenium::WebDriver.for :firefox, :profile => profile

  #launch browser and go to specified url
  browser = Watir::Browser.new(driver)
  screen_width = browser.execute_script("return screen.width;")
  screen_height = browser.execute_script("return screen.height;")
  browser.driver.manage.window.resize_to(screen_width,screen_height)
  browser.goto(url)
  browser
end


#########################################################################################################################
#                                                                                                                       #
#                                          login/logout Methods                                                         #
#                                                                                                                       #
#########################################################################################################################

=begin
  Login to CEA, but wait for the main CC screen to appear.
  We need this because sometimes the login can take a bit longer and then the rest of a test will fail if we
  don't wait for the login process to complete
=end
def login(b, userid, password)
  b.text_field(:name, "username").set userid
  b.text_field(:name, "password").set password
  b.button(:src, "imgs/go_button_normal.png").click
  waitForLoginToComplete(b)
end

=begin
  Login but don't wait for the login process to complete. We need this is situations where we expect the login to fail
  eg wrong password or locked account. If we used the default login method, the test would fail because the main cc screen
  would never appear
=end
def loginNoWait(b, userid, password)
  b.text_field(:name, "username").set userid
  b.text_field(:name, "password").set password
  b.button(:src, "imgs/go_button_normal.png").click
end

def waitForLoginToComplete(browser)
  Watir::Wait.until {browser.link(:text, /Log out/).exists?}
end

=begin
  Logout of CEA
=end
def logout(b)
  b.link(:text, /Log out/).click
end


#########################################################################################################################
#                                                                                                                       #
#                                    Methods that determine state of UI elements                                        #
#                                                                                                                       #
#########################################################################################################################
def isSidePanelOpen(browser)
  return browser.element(:class, "subscriber-panel-left-panel").present?
end

=begin
  Are we at the CEA login screen
=end
def atLoginScreen(browser)
  return browser.button(:src, "imgs/go_button_normal.png").present?
end

=begin
  Is the specified user logged in
=end
def isUserLoggedIn(browser, user)
  return browser.text.include?("Logged as #{user}")
end

=begin
  Helper method that checks for the presence of a string in the login page which indicates if this is a preferred browser or not
=end
#We will test for the presence of this string to see if this a preferred browser or not
@@preferredBrowser = 'It is strongly recommended that you use '

def isPreferredBrowser(browser)
  ! browser.text.include?(@@preferredBrowser)
end

def mapTabExists(browser)
  return browser.element(:xpath, MapTabxpath).present?
end

def sessionsTabExists(browser)
  return browser.element(:xpath, SessionsTabXPath).present?
end

def troubleShootingTabExists(browser)
  return browser.element(:xpath, TroubleshootingTabXPath).present?
end

def isSessionClosed(browser)
  return browser.text_field(:name, "searchbox").attribute_value('value') == ''
end

=begin
  Bit of magic here. We can't get the div class directly from Watir so we get the html for the element, and check
  for the class  gwt-TabBarItem-wrapper-selected
=end
def isMapTabActive (browser)
  browser.element(:xpath, MapTabHighlightedXPath).html.include?"gwt-TabBarItem-selected"
end
def isMapTabActive_soc (browser)
  browser.element(:xpath, MapTabHighlightedXPath_soc).html.include?"gwt-TabBarItem-selected"
end

def areLeftPagingControlsVisible(where)
  where.img(:src, 'imgs/page_left.png').present? ||  where.img(:src, 'imgs/page_left_enabled.png')
end

def areRightPagingControlsVisible(where)
  where.img(:src, 'imgs/page_right.png').present? ||  where.img(:src, 'imgs/page_right_enabled.png')
end
#########################################################################################################################
#                                                                                                                       #
#                                    Methods that click on buttons/tab etc                                              #
#                                                                                                                       #
#########################################################################################################################

def openCloseSidebar(browser)
  browser.element(:class, "expand-menu-tab").click
end

=begin
                Methods to switch between tabs
=end
def clickMapTab(b)
  b.element(:xpath,MapTabxpath).click
end
def clickMapTab_soc(b)
  b.element(:xpath,MapTabXPath_soc).click
end
def clickSessionsTab(b)
  b.element(:xpath,SessionsTabXPath).click
end

def clickTroubleShootingTab(b)
  b.element(:xpath,TroubleshootingTabXPath).click
end

def clickSessionsTab_soc(b)
  b.element(:xpath,SessionsTabXPath_soc).click
end

def clickTroubleShootingTab_soc(b)
  b.element(:xpath,TroubleshootingTabXPath_soc).click
end

def clickCloseButton(b)
  b.button(:text, "Close").click
end




#########################################################################################################################
#                                                                                                                       #
#                                    Methods for radio buttons                                                          #
#                                                                                                                       #
#########################################################################################################################

def selectRadioUserAtSameLocation(b)
  b.radio(:label => 'Users at same location').set
  Watir::Wait.until(30){b.table(:xpath, SessionsTabSessionsTableXpath_CC).exists?}
end







#########################################################################################################################
#                                                                                                                       #
#                                          User management methods                                                      #
#                                                                                                                       #
#########################################################################################################################

def createCCUser(username, password)
  browser = start_ff(Server)
  login(browser, "admin", "zhilabs")
  browser.element(:xpath, ManagementConsoleXPath).click
  Watir::Wait.until {browser.element(:xpath,UserMgtUserNameXPath).exists?}
  browser.text_field(:xpath,UserMgtUserNameXPath).set(username)
  browser.text_field(:xpath, UserMgtPassdXpath).set(password)
  browser.text_field(:xpath, UserMgtConfirmPasswdXPath).set(password)
  browser.select_list(:xpath, UserMgtUserRoleXPath).select('cc')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-subscriber-all')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-event-viewer')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-reports-all')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-search-all')
  #Add/Modify button
  browser.button(:xpath, UserMgtAddModifyButtonXPath).click

  #Logout of management console
  browser.element(:title, "Exit Admin Console").click

  #wait for main screen to appear
  Watir::Wait.until {browser.element(:xpath,  ManagementConsoleXPath).exists?}
  browser.close
end


def createSocUser(username, password)
  browser = start_ff(Server)
  login(browser, "admin", "zhilabs")
  browser.element(:xpath, ManagementConsoleXPath).click
  Watir::Wait.until {browser.element(:xpath,UserMgtUserNameXPath).exists?}
  browser.text_field(:xpath,UserMgtUserNameXPath).set(username)
  browser.text_field(:xpath, UserMgtPassdXpath).set(password)
  browser.text_field(:xpath, UserMgtConfirmPasswdXPath).set(password)
  browser.select_list(:xpath, UserMgtUserRoleXPath).select('soc')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-subscriber-all')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-event-viewer')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-reports-all')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-search-all')
  browser.select_list(:xpath, UserMgtUserRightsXPath).select('gui-service-operation-center-all')
  #Add/Modify button
  browser.button(:xpath, UserMgtAddModifyButtonXPath).click

  #Logout of management console
  browser.element(:title, "Exit Admin Console").click

  #wait for main screen to appear
  Watir::Wait.until {browser.element(:xpath,  ManagementConsoleXPath).exists?}
  browser.close
end

def deleteUser(username)
  browser = start_ff(Server)
  login(browser, "admin", "zhilabs")
  #management console
  browser.element(:xpath, ManagementConsoleXPath).click
  Watir::Wait.until {browser.element(:xpath,UserMgtUserNameXPath).exists?}

  browser.text_field(:xpath,UserMgtUserNameXPath).set(username)
  browser.button(:xpath,UserMgtDeleteButtonXPath).click

  #Logout of management console
  browser.element(:title, "Exit Admin Console").click

  #wait for main screen to appear
  Watir::Wait.until {browser.element(:xpath,  ManagementConsoleXPath).exists?}
  browser.close
end


=begin
                Search for the given IMSI for the given dateTimes in the given browser window
                There is a limitation, in that the datetime selector seems a bit weied if we set the datetime first, so we do the search first,
                then set the datetime range
=end
def searchForImsi(b, imsi, fromDate, toDate)
  begin
    enterImsi(b, imsi)
    b.element(:xpath,SearchButtonXPath).click
    Watir::Wait.until(30){b.canvas(:class, 'EVENTS_TIMELINE').exists?}
    enterSearchDate(b,fromDate,toDate)
    Watir::Wait.until(30){b.canvas(:class, 'EVENTS_TIMELINE').exists?}
  rescue   Exception => e
    puts e.message
    puts e.backtrace.inspect
    cancelButton = b.element(:xpath,CancelButton)
    if(cancelButton.present?)
      cancelButton.click
      searchForImsi(b, imsi, fromDate, toDate)
    end
  end
end


def searchForImsiNoDate(b, imsi)
  enterImsi(b, imsi)
  b.element(:xpath,SearchButtonXPath).click
end

def enterImsi_noWait(b, imsi)
  b.text_field(:name, "searchbox").set imsi
end

def enterImsi(b, imsi)
  b.text_field(:name, "searchbox").set imsi
  Watir::Wait.until(30){b.text_field(:name, "searchbox").attribute_value('value') == imsi}
end

def enterSearchDate(b, fromDate, toDate)
  b.element(:xpath,DateTimeField).click
  #Depending on what has happened before, the xpaths might be differemt, so we need to check to see if the side panel
  #popout is present and then shift the xpaths accordingly
  clearbutton = ClearButton;
  fromdate = FromDateXPath;
  todate = ToDateXPath;
  applyNutton = ApplyButton;
  if(b.element(:xpath,"/html/body/div[7]/div/table").exists?)
    clearbutton = ClearButton_soc;
    fromdate = FromDateXPath_soc;
    todate = ToDateXPath_soc;
    applyNutton = ApplyButton_soc;
  end
  b.element(:xpath, clearbutton).click
  b.text_field(:xpath,fromdate).click
  b.text_field(:xpath,fromdate).set fromDate
  begin
    Watir::Wait.until{b.text_field(:xpath,fromdate).attribute_value('value') == fromDate}
  rescue #Bad coding here, but if we failed to enter a start date, we have to try again
    b.element(:xpath,DateTimeField).click
    b.element(:xpath, clearbutton).click
    b.text_field(:xpath,fromdate).click
    b.text_field(:xpath,fromdate).set fromDate
    Watir::Wait.until{b.text_field(:xpath,fromdate).attribute_value('value') == fromDate}
  end
  b.text_field(:xpath, todate).click
  b.text_field(:xpath, todate).set toDate
  Watir::Wait.until{b.text_field(:xpath,todate).attribute_value('value') == toDate}
  b.text_field(:xpath,fromdate).click
  b.element(:xpath, applyNutton).click
end

=begin
as xpath is cahnged for clearbutton and todate and fromdate
new method being created for entersearchDateForSoc
=end


def searchForImsiForSoc(b, imsi, fromDate, toDate)
  enterImsi(b, imsi)
  b.element(:xpath,SearchButtonXPath).click
  Watir::Wait.until {b.canvas(:id, 'indicators-result').exists?}
  enterSearchDateForSoc(b,fromDate,toDate)
  Watir::Wait.until {b.canvas(:id, 'indicators-result').exists?}
end



def enterSearchDateForSoc(b, fromDate, toDate)
  b.element(:xpath,DateTimeField).click
  b.element(:xpath, ClearButton_soc).click
  b.text_field(:xpath,FromDateXPath_soc).click
  b.text_field(:xpath,FromDateXPath_soc).set fromDate
  begin
    Watir::Wait.until{b.text_field(:xpath,FromDateXPath_soc).attribute_value('value') == fromDate}
  rescue #Bad coding here, but if we failed to enter a start date, we have to try again
    b.element(:xpath,DateTimeField).click
    b.element(:xpath, ClearButton_soc).click
    b.text_field(:xpath,FromDateXPath_soc).click
    b.text_field(:xpath,FromDateXPath_soc).set fromDate
    Watir::Wait.until{b.text_field(:xpath,FromDateXPath_soc).attribute_value('value') == fromDate}
  end

  b.text_field(:xpath, ToDateXPath_soc).click
  b.text_field(:xpath, ToDateXPath_soc).set toDate
  Watir::Wait.until{b.text_field(:xpath,ToDateXPath_soc).attribute_value('value') == toDate}
  b.text_field(:xpath,FromDateXPath_soc).click
  b.element(:xpath, ApplyButton_soc).click
end






=begin
click on apply button after clicking on imsi , date and time
then after click on clear button to enter new date and time.
=end

def clickApplyButton(b,imsi, fromDate, toDate)
  enterImsi(b, imsi)
  enterSearchDate(b,fromDate,toDate)
  b.element(:xpath, ApplyButton).click
  Watir::Wait.until {b.canvas(:id, 'indicators-result').exists?}
end

def clickClearButton(b, fromdate, todate)
  b.element(:xpath, ClearButton).click
  b.text_field(:xpath, FromDateXPath ).clear
  b.text_field(:xpath, ToDateXPath ).clear
end

def changeDateTime(b, fromdate, todate)
  b.text_field(:xpath, FromDateXPath ).click
  b.text_field(:Xpath, FromDateXPath).set fromdate
  b.text_field(:xpath, ToDateXPath ).clear
  b.text_field(:XPath, ToDateXPath).set todate
end

def setLocation(b, location)
  b.text_field(:xpath, LocationFilterTextBox_CC).set location
  b.element(:xpath, LocationFilterTextBoxSearchButton_CC).click
end

def setLocation_soc(b, location)
  b.text_field(:xpath, LocationFilterTextBox_SOC).set location
  b.element(:xpath, LocationFilterTextBoxSearchButton_SOC).click
end

def clearLocation(b)
  b.text_field(:xpath, LocationFilterTextBox_CC).set
  b.element(:xpath, LocationFilterTextBoxSearchButton_CC).click
end

def getResultAreaWidth(browser)
  browser.element(:id, "resultarea").style("width").to_i
end

def getResultAreaHeight(browser)
  browser.element(:id, "resultarea").style("height").to_i
end

def clearLocation_soc(b)
  b.text_field(:xpath,LocationFilterTextBox_SOC ).set
  b.element(:xpath, LocationFilterTextBoxSearchButton_SOC).click
end
