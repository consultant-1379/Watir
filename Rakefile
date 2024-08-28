require 'rake/testtask'
require './modules/utilities'
gem 'test-unit'
require 'test/unit'
require 'ci/reporter/rake/minitest'

randomId = 1 + rand(100000)
Server ||= "http://atrcxb2336.athtem.eei.ericsson.se:8080/login.html"
CCUser = "watir" + randomId.to_s + "_cc"
SocUser = "watir" + randomId.to_s + "_soc"
Password = "Watir_" + randomId.to_s

Rake::TestTask.new(:runtests) do |t|
  t.libs << "test"
  t.test_files = FileList['./**/Test*.rb']
  t.verbose = true
end

task :testSetup do
  Server = "http://#{ENV["server"]}.athtem.eei.ericsson.se:8080/login.html"
  p "Using the following server\n\n#{Server}\n\n"
  #Lets create our own user for these tests
  createCCUser(CCUser, Password)
  createSocUser(SocUser, Password)
end

task :testCleanUp do
  #Delete our own user
  deleteUser(CCUser)
  deleteUser(SocUser)
end


task :runAllTests => [:testSetup,:runtests, :testCleanUp]
