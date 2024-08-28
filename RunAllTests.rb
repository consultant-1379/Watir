require './modules/utilities'
gem 'test-unit'
require 'test/unit'
#########################################################################################################################
#                                                                                                                       #
#                                            Constants                                                                  #
#                                                                                                                       #
#########################################################################################################################
randomId = 1 + rand(100000)
if ARGV.length > 0
  Server = "http://#{ARGV[0]}:8080/login.html"
else
  Server ||= "http://atrcxb2338.athtem.eei.ericsson.se:8080/login.html"
end
CCUser = "watir" + randomId.to_s + "_cc"
SocUser = "watir" + randomId.to_s + "_soc"
Password = "Watir_" + randomId.to_s


class Temp < Test::Unit::TestCase
  Test::Unit.at_start do

    p "Using the following server\n\n#{Server}\n\n"
    #Lets create our own user for these tests
    createCCUser(CCUser, Password)
    createSocUser(SocUser, Password)
  end

  Test::Unit.at_exit do
    #Delete our own user
    deleteUser(CCUser)
    deleteUser(SocUser)
  end

  Dir["./**/Test*.rb"].each { |s|
    load s
  }
end