begin
  ENV['no-http-proxy'] = "127.0.0.1"
  require './modules/utilities'
  require './modules/cea-fileutils'
  require './modules/server-details'
  require 'date'

######################################################################################################################################################
#                                                                                                                                                    #
# AutoIMSI_MultipleBrowsers - Data Tests - Use in conjunction with ksar to test the performance of cea, a list of IMSI's is entered in the CEA GUI'  #
#                                                                                                                                                    #
######################################################################################################################################################
  password = "Ericsson2013"
  users = 3

  p "Creating #{users} CC Users"
  for i in 1..users.to_int
    user = "cc_user#{i}"
    p user
    createCCUser(user,password)
  end

  browsers = Array.new(users.to_int) { start_ff(Server) }

   for x in 0...browsers.length
     p "cc_user#{x+1}"
     login(browsers[x],"cc_user#{x+1}", password)
   end


#Read data from the Datasource file
  dataArray = readTestDataFile('TestData\AutoIMSI_MultipleBrowsers.csv')
  count = 0
  dataArray.each { |row|
    imsi_1 = row[0]
    imsi_2 = row[1]
    imsi_3 = row[2]
    imsi_4 = row[3].strip
    dateNow =  DateTime.now
    #Current date - 3hrs
    datePast =  dateNow - 0.125

    #incidentTable = browser.table(:xpath, IncidentsTableXPath_CC)
    for x in 0...browsers.length
      p "#{count+=1} - Browser[#{x}] - User[cc_user#{x+1}] - #{row} - #{datePast.strftime('%d/%m/%Y %H:%M:%S')}-#{dateNow.strftime('%d/%m/%Y %H:%M:%S')}"
      for y in 0...row.length
        searchForImsi(browsers[x], row[y].strip, datePast.strftime('%d/%m/%Y %H:%M:%S'), dateNow.strftime('%d/%m/%Y %H:%M:%S'))
      end
    end

  }

  for x in 0...browsers.length
    browsers[x].close
  end
  for i in 1..users.to_int
    user = "cc_user#{i}"
    deleteUser(user)
  end

end