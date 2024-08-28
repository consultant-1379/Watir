#########################################################################################################################
#                                                                                                                       #
# Test 3.10.1.1.10 - Sessions Table - check that the table contains time-sorted 15 minute sessions for the customer.                                     #
#                                                                                                                       #
#########################################################################################################################
require './modules/ccGuiBaseTestClass'


class Test3_10_1_1_10 < CCGuiBaseTestClass

  def testSessionsTableTimeSortedSessionForCustomer
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)

    clickSessionsTab(@@browser)
    sessionsTable = @@browser.table(:xpath, SessionsTableXPath_CC)

    #verify table contains time-sorted 15 minute sessions for the customer.
    if (sessionsTable.present?)

      times = Array.new
      sessionsTable.rows[1..-1].each do |row|
        # luckily DateTime.parse() can form DateTime object from string format used on GUI
        # irb(main):052:0* f = DateTime.parse('May 17, 03:45 - 04:00')
        # => #<DateTime: 2012-05-17T03:45:00+00:00 ((2456065j,13500s,0n),+0s,2299161j)>
        times.push(DateTime.parse(row[0].text))
      end

      # copy & sort the array by time descending. This is how CEA should have it presented to us already in order for test to pass;
      sorted_times = Array.new(times.sort.reverse)
      #sorted_times = Array.new(times.sort)

      assert_equal(sorted_times, times, 'Times were not sorted in order on Session table on CC GUI.')

    end


  end
end

