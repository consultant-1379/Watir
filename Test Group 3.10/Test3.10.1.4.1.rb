#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.4.1 - Sessions Table - different time ranges are separated by a border                                    #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'


class Test3_10_1_4_1 < CCGuiBaseTestClass

  def testSessionsTableTimeSortedSessionForCustomer
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)

    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTableXPath_CC)

    pass = false
    if (sessionsTable.present?)

      pass = true
      rows = sessionsTable.rows
      pos = 1
      currentcell = ''
      nextcell = ''
      while rows.size-1 > pos

        p rows[pos].cells[0].text
        p rows[pos+1].cells[0].text
        # check current row with next row
        if !rows[pos].cells[0].text.eql? rows[pos+1].cells[0].text

          # if times are different, expect a top border on 'next' row
          if !rows[pos+1].cells[0].attribute_value("class").include?('insert-top-border')
            pass = false
            # no need to continue to rest of rows, testcase already failed
            break
          end
        end

        pos += 1

      end

    end

    assert(pass, "insert-top-border not found on cell: #{nextcell}. Previous cell above was: #{currentcell}")
  end
end

