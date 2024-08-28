require './modules/browser-elements'

=begin
  Verify that the customer data is as expected.
=end
def getCustomerNameAndMSISDNfromTitleBar(b)
  return b.element(:xpath, NameAndMsisdnInTitleBarXPath).text
end

def getFullTitleBar(b)
  name = b.element(:xpath, NameAndMsisdnInTitleBarXPath).text
  dateTime = " " +  b.element(:xpath, DateTimeInTitleBarXPath).text
  location =    b.element(:xpath, LocationInTitleBarXPath).text
  #Funky ruby shit here. Create an array, remove any empty strings and finally join them with spaces between.
  #We join name and datetime directly because there is no space between them. and this construct will remove location if it is empty
  return  [name + dateTime, location].reject(&:empty?).join(' ')
end


=begin
  Verify that the customer data is as expected.
=end
def getCustomerNameInSidePanel(b)
  #First row should be the name and second cell in the row is the name
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[0][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getMsisdnInSidePanel(b)
b.table(:xpath, CustomerAndPlanXpath_CC).rows[1][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getValueInSidePanel(b)
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[2][1].text
end

=begin
  Verify that the customer data is as expected.
=end
def getChurnInSidePanel(b)
  #First row should be the name and second cell in the row is the churn
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[3][1].text
end

=begin
  Verify that the customer data is as expected.
=end
def getInfluenceInSidePanel(b)
  #First row should be the name and second cell in the row is the influence
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[4][1].text
end

=begin
  Verify that the customer data is as expected.
=end
def getAgeInSidePanel(b)
  #First row should be the name and second cell in the row is the age on network
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[5][1].text
end

=begin
  Verify that the customer data is as expected.
=end
def getStatusInSidePanel(b)
  #First row should be the name and second cell in the row is the status
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[6][1].text
end
=begin
  Verify that the customer data is as expected.
=end
def getPlanInSidePanel(b)
  #First row should be the name and second cell in the row is the plan
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[7][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getPlanTypeInSidePanel(b)
  #First row should be the name and second cell in the row is the Plan Type
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[8][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getDataInSidePanel(b)
  #First row should be the name and second cell in the row is the Data
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[9][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getDataUsageInSidePanel(b)
  #First row should be the name and second cell in the row is the Data usage
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[10][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getMainUsageInSidePanel(b)
  #First row should be the name and second cell in the row is the Main usage
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[11][1].text
end


=begin
  Verify that the customer data is as expected.
=end
def getPaymentInSidePanel(b)
  #First row should be the name and second cell in the row is the Payment
  b.table(:xpath, CustomerAndPlanXpath_CC).rows[12][1].text
end

=begin
  Verify that the customer data is as expected.
=end
def getPhoneNameInSidePanel(b)
  #First row should be the name and second cell in the row is the Payment
  b.table(:xpath, DeviceInformationXpath_CC).rows[0][1].text
end
=begin
  Verify that the customer data is as expected.
=end
def getPhoneTypeInSidePanel(b)
  #First row should be the name and second cell in the row is the Payment
  b.table(:xpath, DeviceInformationXpath_CC).rows[1][1].text
end

def getPhoneOSInSidePanel(b)
  #First row should be the name and second cell in the row is the Payment
  b.table(:xpath, DeviceInformationXpath_CC).rows[2][1].text
end