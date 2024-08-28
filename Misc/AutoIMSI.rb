begin
  ENV['no-http-proxy'] = "127.0.0.1"
  require './modules/utilities'
  require './modules/cea-fileutils'
  require './modules/server-details'
  require 'date'

####################################################################################################################################
#                                                                                                                                  #
# AutoIMSI - Data Tests - Use in conjunction with ksar to test the performance of cea, a list of IMSI's is entered in the CEA GUI' #                                      #
#                                                                                                                                  #
####################################################################################################################################
  #createCCUser("cc_eeimho","Ericsson2013")
  browser = start_ff(Server)
  login(browser,CCUser, Password)

#Read data from the Datasource file
  dataArray = readTestDataFile('TestData\AutoIMSI.csv')
  x = 0
  dataArray.each { |row|
    imsi = row[0].strip
    dateNow =  DateTime.now
    #Current date - 3hrs
    datePast =  dateNow - 0.125
    p "#{x+=1} - #{imsi} - #{datePast.strftime('%d/%m/%Y %H:%M:%S')}-#{dateNow.strftime('%d/%m/%Y %H:%M:%S')}"
    #incidentTable = browser.table(:xpath, IncidentsTableXPath_CC)
    searchForImsi(browser, imsi, datePast.strftime('%d/%m/%Y %H:%M:%S'), dateNow.strftime('%d/%m/%Y %H:%M:%S'))
    }
  browser.close
  #deleteUser("cc_eeimho")
end