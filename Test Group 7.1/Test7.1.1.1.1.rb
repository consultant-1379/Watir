=begin
ENV['no-http-proxy'] = "127.0.0.1"
require './modules/utilities'
require './modules/cea-fileutils'
require './modules/server-details'

#########################################################################################################################
#                                                                                                                       #
# Test 7.1.1.1.1 - Data Tests - Verify RCA's for known data sources and incidents                                       #
#                                                                                                                       #
#########################################################################################################################                                                                
browser = start_ff(Server)
login(browser,CCUser, Password)

#Read data from the Datasource file
dataArray = readTestDataFile('a.txt')
                      x = 0
dataArray.each { |row|
  tc_name = row[1]
  imsi = row[0]
  fromDate = row[2]
  toDate = row[3]
  expectedData = row[4..8]
  numIncidents = row[6]
  detailedPrefix = 'Found erroneous data in the Incidents table: '
  p "#{x+=1} - #{imsi} - #{tc_name} "
  searchForImsi(browser, imsi, fromDate, toDate)
  incidentTable = browser.table(:xpath, IncidentsTableXPath)
  if(numIncidents.to_i > 0 && !incidentTable.present?)
    result = false
    detailedMsg = 'No incidents found'
  else
    rows = incidentTable.rows
    if (rows.length > 2)
      result = false
      detailedMsg = "Got too many results, expected 2 but got #{rows.length}"
    else
      (0...4).each do |x|
        if(expectedData[x] != rows[1][x].text)
           detailedMsg = ""#{detailedMsg} Expected #{expectedData[x]} got #{rows[1][x].text}," 
        end 
      end
    end
  end
  logResult('Test 7.1.1.1.1', 'Data Tests', tc_name, result, detailedPrefix + detailedMsg)
}
=end