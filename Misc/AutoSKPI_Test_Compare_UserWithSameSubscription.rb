begin
  ENV['no-http-proxy'] = "127.0.0.1"
  require './modules/utilities'
  require './modules/cea-fileutils'
  require './modules/server-details'

#########################################################################################################################
#                                                                                                                       #
# Test 3.6.5.1.1 - Data Tests - Verify % values of SKPI                                                                 #
#                                                                                                                       #
#########################################################################################################################                                                                
  browser = start_ff(Server)
  login(browser, CCUser, Password)

#Read data from the Datasource file
  dataArray = readTestDataFile('TestData\AutoSKPI_Test_Compare_UserWithSameSubscription.csv')
  x = 0
  dataArray.each { |row|
    #puts row.each {|y| print y + ","}
    tc_name = row[1]
    imsi = row[0]
    fromDate = row[2]
    toDate = row[3]
    time = "#{row[4]},#{row[5]}"
    indicator = row[6]
    indicatorValue =row[7]
    expectedData = row[4..7]
    numIncidents = row[6]
    category = row[8].strip
    detailedPrefix = 'Found erroneous data in the Incidents table: '
    result = false
    detailedMsg = ""
    puts time
    p "#{x+=1} - #{imsi} - #{tc_name} "
    p fromDate + "-" + toDate

    #searchForImsi(browser, imsi, fromDate, toDate)
    begin
      searchForImsi(browser, imsi, fromDate, toDate)
    rescue
      p "need to rescue"
      cancelButton = browser.element(:xpath, '/html/body/div[8]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr/td/button')
      if (cancelButton.present?)
        p "Pop-up time Dialog :: #{x+=1} - #{imsi} - #{tc_name}"
        cancelButton.click
      end
      searchForImsi(browser, imsi, fromDate, toDate)
    end


    clickSessionsTab(browser)
    if (browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).present?)
      browser.element(:xpath, SessionsTabShowAlLDetailsLinkXpath_CC).click
    end
    #browser.radios.each { |r| puts r.to_s }
    if (browser.radio.present?)
        browser.radio(:index, 2).set
    end
      #p browser.radio(:id,"gwt-uid-2").present?
      #browser.radio(:id,"gwt-uid-2").set?


      selector = browser.select_list(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td/div/select')
      selector.select_value(category)

      incidentTable = browser.table(:xpath, '//*[@id="resultarea"]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/table[2]/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/table/tbody/tr[2]/td/div/div[3]/table/tbody/tr[3]/td/div/div/div/table')

      #p incidentTable.present?


      if (!incidentTable.present?)
        result = false
        detailedMsg = 'No incidents found'
      else
        rows = incidentTable.rows
        puts rows.length
        for i in 1..rows.length-1
          if (rows[i][0].text == time)
            #puts "time OK"
            if (rows[i][1].text == indicator)
              #puts "Indicator OK #{rows[i][2].text}"
              value = rows[i][3].text
              if (rows[i][3].text == indicatorValue)
                #puts "Indicator Value OK"
                result = true
              end
            end
          end
        end
        if (result == false)
          detailedMsg = "#{detailedMsg} Expected #{time} - #{indicator} - #{value} No value matched},"
        end
      end
      puts "Test 3.6.5.1.1 , Data Tests, #{tc_name} , #{result}, detailedPrefix  #{detailedMsg}"
      logResult('Test 3.6.5.1.1', 'Data Tests', tc_name, result, detailedPrefix + detailedMsg)
      }
    end
