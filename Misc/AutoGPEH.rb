begin
  ENV['no-http-proxy'] = "127.0.0.1"
  require './modules/utilities'
  require './modules/cea-fileutils'
  require './modules/server-details'

#########################################################################################################################
#                                                                                                                       #
# AutoGPEH - Data Tests - Verify RCA's for known data sources and incidents                                       #
#                                                                                                                       #
#########################################################################################################################                                                                
  browser = start_ff(Server)
  login(browser,CCUser, Password)

#Read data from the Datasource file
  dataArray = readTestDataFile('TestData\AutoGPEH.csv')
  x = 0
  dataArray.each { |row|
    tc_name = row[1]
    imsi = row[0]
    fromDate = row[2]
    toDate = row[3]
    expectedData = [row[4..8],row[9..13],row[14..18],row[19..23],row[24..28],row[29..33]]
    detailedPrefix = 'Found erroneous data in the Incidents table: '
    detailedMsg = ''
    result = true
    p "#{x+=1} - #{imsi} - #{tc_name} "
    p fromDate + "-" + toDate
    searchForImsi(browser, imsi, fromDate, toDate)
    incidentTable = browser.table(:xpath, IncidentsTableXPath_CC)


    if(!incidentTable.present?)
      result = false
      detailedMsg = 'No incidents found'
    else
      rows = incidentTable.rows
      if (rows.length > 7)
        result = false
        detailedMsg = "Got too many results, expected 6 but got #{rows.length-1}"
      else
        (1...7).each do |x|
            (0...expectedData.length).each do |y|
              if(expectedData[y][1] == rows[x][1].text)
                #p "Comparing Incident values to CSV file."
                #p  expectedData[y]
                #p rows[x].text
                (0...3).each do |z|
                  if(expectedData[y][z] != rows[x][z].text)
                    result = false
                    detailedMsg = "#{detailedMsg} Expected '#{expectedData[y][z]}' got '#{rows[x][z].text}',"
                  end
                end
                index = x + 1
                xpathvariable = '/html/body/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table/tbody/tr['+index.to_s+']/td[4]/table/tbody/tr/td[2]'
                if (browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').present? == true)
                  browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').fire_event "onmouseover"
                  cellTable = browser.table(:xpath, CellPopupTableXpath_CC)
                  if(cellTable.present?)
                    cellRows = cellTable.rows
                    if (cellRows.length > 2)
                      result = false
                      detailedMsg = "#{detailedMsg} found too many Cells, expected 1 but got #{cellRows.length-1},"
                    else
                      p cellRows[1][0].text
                      if(expectedData[y][4] != cellRows[1][0].text)
                        result = false
                        detailedMsg = "#{detailedMsg} Cell Id incorrect Expected [#{expectedData[y][4]}] got [#{cellRows[1][0].text}]"
                      end
                    end
                  end
                end
                break
              end
            end
        end
      end
    end
    p detailedMsg
    p result
    logResult('Test 7.1.1.1.1', 'Data Tests', tc_name, result, detailedMsg)
  }
  browser.close
end