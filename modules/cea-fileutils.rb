require 'CSV'
#########################################################################################################################
#                                                                                                                       #
#                                          Constants                                                                    #
#                                                                                                                       #
#########################################################################################################################
@resultsFile = "results.csv"
@htmlFile="results.html"


#########################################################################################################################
#                                                                                                                       #
#                                          Public Methods                                                               #
#                                                                                                                       #
#########################################################################################################################
=begin
  Method to log the result of the test execution.
  tc_num String Test Case number as per the VS
  tc_name String Test Case name as per the VS
  result Boolean Test result
  detailed_msg String Message to be included in results in the event of a test failure
=end
def logResult(tc_num, tc_name, tc_desc, result, detail_msg)
  writeResult(tc_num, tc_name, tc_desc, result, detail_msg)
  writeHtmlResults(tc_num, tc_name, tc_desc, result, detail_msg)
end


#########################################################################################################################
#                                                                                                                       #
#                                          Private Methods                                                              #
#                                                                                                                       #
#########################################################################################################################

=begin
  Open a new HTLM file for editing
=end
def openHtmlFile()
  #Setup of log file for test results
  time = Time.new
  formattedTime = time.strftime("%Y-%m-%d %H%M")
  if(!File.exists?(@htmlFile))
    file = File.open(@htmlFile, "w")
    file.write("
      <!DOCTYPE html>
      <html>
        <head>
          <title>CEA Test Results</title>
        </head>
        <body>
          <h1>Cea Test Results " + formattedTime + "</h1> <p>")
  
    file.write("<table border=\"1\" width=100%>
          <tr>
            <th>Test Number</th>,
            <th>Test Heading</th>
            <th>Test Description</th>
            <th>Result</th>
            <th>Detailed Message</th>
          </tr>")
        
  end
end

=begin
  Append results to html file in table format
=end
def writeHtmlResults(tc_num, tc_name, tc_desc, result, detail_msg)
  
  #Open result files for editing  
  openHtmlFile
  file = File.open(@htmlFile, "a")
  if(result)
    bgcolor = 'LightGreen'
    test = 'Passed'
  else
    test = 'Failed'
    bgcolor = 'Tomato'
  end
  file.write("
    <tr bgcolor=\' #{bgcolor} \'>
      <td> #{tc_num} </td>
      <td> #{tc_name} </td>
      <td> #{tc_desc} </td>
      <td> #{test} </td>
      <td> #{detail_msg}</td>
    </tr>")
end

=begin
  Close the html file
=end

def writeHtmlFooter(htmlfile)
  file = File.open(htmlfile, "a")
  file.write("\t\t</table>\n</body>\n</html>")
end


=begin
  Append the results to the csv file
=end
def writeResult(tc_num, tc_name, tc_desc, result, detail_msg)
  openResultFile
  #Setup of log file for test results
  if(result)
    test = 'Passed'
  else
    test ='Failed'
  end
  
  CSV.open(@resultsFile, "a") do |csv|
  csv << [tc_num, tc_name, tc_desc, test, detail_msg]
  end
end



=begin
  Open a new results file
=end
def openResultFile()
  if(!File.exists?(@resultsFile))
    #Write header information
    CSV.open(@resultsFile, "w")do |csv|
      csv << ["Test number", "Test Name", "Test Description", "Test Result", "Detailed Message"]
    end
  end
end

=begin
  Read from a customer data file, and store values in a hash of hashes
  object will be IMSI -> Customer Data and Customer Data will contain for example Name -> <name>, MSISDN -> <msisdn> etc
=end

def readCustomerFile(file)
  hash = {}
  File.open(file) do |fp|
    fp.each do |line|
      key, value = line.chomp.split(";")
      vHash = Hash[*value.chomp.split(/,+/)]
      hash[key] = vHash
    end
  end
  return hash
end

=begin
  Read from a test data file, and store values in an array
=end

def readTestDataFile(file)
  open(file).map { |line| line.split(',') }
end