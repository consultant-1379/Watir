require './modules/ccGuiBaseTestClass'

#########################################################################################################################
#                                                                                                                       #
#	Test 3.1.4.1.1 Report Filter/Customer Info Panel -  Check panel can be shown/hidden                                   #
#                                                                                                                       #
#########################################################################################################################                                                                
class Test3_1_4_1_1 < CCGuiBaseTestClass
  def testSidePanelCanBeClosed
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)

    if(!isSidePanelOpen(@@browser))
      #Not open so try to open.
      openCloseSidebar(@@browser)
    end
    openCloseSidebar(@@browser)
    assert(!isSidePanelOpen(@@browser), 'Could not close the sidebar')
  end

  def testSidePanelCanBeOpened
    searchForImsi(@@browser, @@defaultIMSI, @@defaultDateFrom, @@defaultDateTo)

    if(isSidePanelOpen(@@browser))
      #Not open so try to open.
      openCloseSidebar(@@browser)
    end
    openCloseSidebar(@@browser)
    assert(isSidePanelOpen(@@browser), 'Could not open the sidebar')
  end
end

