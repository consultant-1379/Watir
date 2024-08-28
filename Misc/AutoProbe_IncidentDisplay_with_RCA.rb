begin
  ENV['no-http-proxy'] = "127.0.0.1"
  require './modules/utilities'
  require './modules/cea-fileutils'
  require './modules/server-details'

#########################################################################################################################
#                                                                                                                       #
# Test 7.1.1.1.2 - Data Tests - Verify RCA's for known data sources and incidents                                       #
#                                                                                                                       #
#########################################################################################################################                                                                
  #createCCUser("cc_eeimho","Ericsson2013")
  browser = start_ff(Server)
  login(browser,CCUser, Password)
  #login(browser,"cc_eeimho", "Ericsson2013")

#Read data from the Datasource file
  dataArray = readTestDataFile('TestData\AutoProbe_IncidentDisplay_with_RCA.csv')
  x = 0

  dataArray.each { |row|
    tc_name = row[1]
    imsi = row[0]
    fromDate = row[2]
    toDate = row[3]
    probableCause = row[4]
    impactedIndicator = row[5]
    expectedData = row[4..6]
    numIncidents = row[6]
    cellId = row[8].strip
    detailedPrefix = 'Found erroneous data in the Incidents table: '
    impactedIndicators = ['FILE_TRANSFER','EMAIL','VIDEO_ON_DEMAND','WEB_BROWSING']
    detailedMsg = ''
    result = true
    p "#{x+=1} - #{imsi} - #{tc_name} "
    # p fromDate + "-" + toDate
    searchForImsi(browser, imsi, fromDate, toDate)
    incidentTable = browser.table(:xpath, IncidentsTableXPath_CC)


    if(numIncidents.to_i > 0 && !incidentTable.present?)
      result = false
      detailedMsg = 'No incidents found'
    else
      rows = incidentTable.rows
      if (rows.length > 5)
        result = false
        detailedMsg = "Got too many results, expected 4 but got #{rows.length-1}"
      else

        #For every row check it against the expected values
        (1...rows.length).each do |x|
          detailedMsg = "#{detailedMsg} \n"
          #(0...3).each do |y|
          #  if(expectedData[y] != rows[x][y].text)
          #    result = false
          #    detailedMsg = "#{detailedMsg} Expected #{expectedData[y]} got #{rows[x][y].text},"
          #  end
          #end

          if(probableCause !=rows[x][0].text )
            result = false
            detailedMsg = "#{detailedMsg} Probable Cause incorrect expected '#{probableCause}' got '#{rows[x][0].text}',"
          end
          (0...impactedIndicators.length).each do |y|
            if(impactedIndicators[y] == rows[x][1].text)
              #impactedIndicators.delete(rows[x][1].text)
              break
            end
            if(y == impactedIndicators.length-1 )
              result = false
              detailedMsg = "#{detailedMsg} Impacted Indicator incorrect expected #{impactedIndicators} got #{rows[x][1].text},"
            end
          end
          index= x + 1
          xpathvariable = '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td/div/table/tbody/tr/td/div/table/tbody/tr['+index.to_s+']/td[4]/table/tbody/tr/td[2]'
          if (browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').present? == true)
            browser.element(:xpath,xpathvariable).image(:src, 'imgs/cell-marker.png').fire_event "onmouseover"
            cellTable = browser.table(:xpath, CellPopupTableXpath_CC)
            if(cellTable.present?)
              cellRows = cellTable.rows
              if (cellRows.length > 2)
                result = false
                detailedMsg = "#{detailedMsg} found too many Cells, expected 1 but got #{cellRows.length-1},"
              else
                if(cellId != cellRows[1][0].text)
                  result = false
                  detailedMsg = "#{detailedMsg} Cell Id incorrect Expected [#{cellId}] got [#{cellRows[1][0].text}],"
                end
              end
            end
          end
        end
      end
    end
    p result
    logResult('Test 7.1.1.1.1', 'Data Tests', tc_name, result, detailedMsg)
  }
  browser.close
  #deleteUser("cc_eeimho")
end